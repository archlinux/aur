# Contributor: gucong <gucong43216@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-sdcv
pkgver=2.7
pkgrel=1
pkgdesc="An extension to lookup words through sdcv (StarDict Console Version) in Emacs."
arch=('any')
url="http://code.google.com/p/sdcv-mode/"
license=('GPL')
depends=('emacs' 'sdcv' 'emacs-posframe')
install=$pkgname.install
source=(https://www.emacswiki.org/emacs/download/sdcv.el)
sha256sums=('6e24f5a8df40be8b865fd7b55a60f69568f664fb066bd05c58202c61eb71e120')

build() {
  emacs -Q -batch -L /usr/share/emacs/site-lisp -f batch-byte-compile sdcv.el
}
package() {
  install -D -m 644 "$srcdir"/${pkgname#emacs-}.el \
    "$pkgdir"/usr/share/emacs/site-lisp/${pkgname#emacs-}.el
 install -D -m 644 "$srcdir"/${pkgname#emacs-}.elc \
    "$pkgdir"/usr/share/emacs/site-lisp/${pkgname#emacs-}.elc
}
