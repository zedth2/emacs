(defun textmate-mode-hook ()
  (textmate-mode t)
  (global-set-key (kbd "M-RET") 'textmate-next-line)
  (global-set-key (kbd "M-/") 'comment-or-uncomment-region-or-line)
  (global-set-key (kbd "M-t") 'textmate-goto-file)
  (global-set-key (kbd "M-T") 'textmate-goto-symbol)
  (global-set-key (kbd "M-]") 'textmate-shift-right)
  (global-set-key (kbd "M-[") 'textmate-shift-left))

(defun ruby-mode-hook ()
  (autoload 'ruby-mode "ruby-mode" nil t)
  (add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
  (add-hook 'ruby-mode-hook '(lambda ()
                               (setq ruby-deep-arglist t)
                               (setq ruby-deep-indent-paren nil)
                               (setq c-tab-always-indent nil)
                               (setq ruby-insert-encoding-magic-comment nil)
                               (load "helpers/rails.el")
                               (define-key ruby-mode-map (kbd "M-r") 'ruby-compilation-this-buffer)
                               (define-key ruby-mode-map (kbd "C-l") 'insert-ruby-hash-pointer))))

(defun rhtml-mode-hook ()
  (autoload 'rhtml-mode "rhtml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
  (add-to-list 'auto-mode-alist '("\\.rjs\\'" . rhtml-mode))
  (add-hook 'rhtml-mode-hook '(lambda ()
                                (load "helpers/rails.el")
                                (define-key rhtml-mode-map (kbd "M-s") 'save-buffer)
                                (define-key rhtml-mode-map (kbd "C-l") 'insert-ruby-hash-pointer)
                                (define-key rhtml-mode-map (kbd "M->") 'insert-erb-skeleton))))

(defun rinari-mode-hook ()
  (ruby-mode-hook)
  (progn
    (eval-after-load 'ruby-mode
      '(progn
         ;; work around possible elpa bug
         (ignore-errors (require 'ruby-compilation))
         (setq ruby-use-encoding-map nil)))))

(defun yaml-mode-hook ()
  (autoload 'yaml-mode "yaml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
  (add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode)))

(defun css-mode-hook ()
  (autoload 'css-mode "css-mode" nil t)
  (add-hook 'css-mode-hook '(lambda ()
                              (setq css-indent-level 2)
                              (setq css-indent-offset 2))))

(defun nav-mode-hook ()
  (global-set-key (kbd "M-\\") 'nav))

(defun nterm-hook ()
  (setq nterm-shell "/usr/local/bin/zsh"))
