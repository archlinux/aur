# Contributor: gucong <gucong43216@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-sdcv
pkgver=2.9
pkgrel=1
pkgdesc="An extension to lookup words through sdcv (StarDict Console Version) in Emacs."
arch=('any')
url="https://www.emacswiki.org/emacs/Sdcv"
license=('GPL')
depends=('emacs' 'sdcv' 'emacs-showtip' 'emacs-posframe')
install=$pkgname.install
source=(https://www.emacswiki.org/emacs/download/sdcv.el)
sha256sums=('4bc93558cb9ae6d83cd28c25e147a31c7b1204bf148285360b350fb71c9eb7c7')

build() {
  emacs -Q -batch -L /usr/share/emacs/site-lisp -f batch-byte-compile sdcv.el
}

package() {
  install -D -m 644 "$srcdir"/${pkgname#emacs-}.el \
    "$pkgdir"/usr/share/emacs/site-lisp/${pkgname#emacs-}.el
 install -D -m 644 "$srcdir"/${pkgname#emacs-}.elc \
    "$pkgdir"/usr/share/emacs/site-lisp/${pkgname#emacs-}.elc
}
