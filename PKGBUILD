# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-showtip
pkgver=0.01
pkgrel=1
pkgdesc="An extension for emacs to show tip at curser"
arch=('any')
url="https://www.emacswiki.org/emacs/showtip.el"
license=('GPL')
depends=('emacs')
source=(https://www.emacswiki.org/emacs/download/showtip.el)
md5sums=('9f23b6c45b48d2055a154fae74f5c348')

build() {
  emacs -Q -batch -L . -f batch-byte-compile showtip.el
}

package() {
 install -D -m 644 "$srcdir/showtip.el" \
    "$pkgdir/usr/share/emacs/site-lisp/showtip.el"
 install -D -m 644 "$srcdir/showtip.elc" \
    "$pkgdir/usr/share/emacs/site-lisp/showtip.elc"
}
