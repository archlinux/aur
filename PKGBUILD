# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-commenter
pkgver=0.5.2
pkgrel=1
pkgdesc="Emacs' multiline-comment support package"
arch=('any')
url="https://stable.melpa.org/#/commenter"
license=('GPL3')
depends=('emacs')
source=("https://stable.melpa.org/packages/commenter-$pkgver.el")
sha256sums=('08ee2de60a52f6ebd9eef6025581a29abdd16b0ce8a3f9ebcc6f911546d5e9fa')

build() {
  emacs -Q -batch -L . -f batch-byte-compile *.el
}

package() {
  install -d "$pkgdir"/usr/share/emacs/site-lisp/
  install -Dm644 ${pkgname#emacs-}-$pkgver.el "$pkgdir"/usr/share/emacs/site-lisp/${pkgname#emacs-}.el
  install -Dm644 ${pkgname#emacs-}-$pkgver.elc "$pkgdir"/usr/share/emacs/site-lisp/${pkgname#emacs-}.elc 
}
