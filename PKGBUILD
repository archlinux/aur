# Contributor: gucong <gucong43216@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-sdcv
pkgver=1.5.2
pkgrel=1
pkgdesc="An extension to lookup words through sdcv (StarDict Console Version) in Emacs."
arch=('any')
url="http://code.google.com/p/sdcv-mode/"
license=('GPL')
depends=('emacs' 'sdcv')
install=$pkgname.install
source=(https://www.emacswiki.org/emacs/download/showtip.el https://www.emacswiki.org/emacs/download/sdcv.el)
md5sums=('9f23b6c45b48d2055a154fae74f5c348'
         '2574be32d3010ac6e923def079b45e2c')

build() {
  emacs -Q -batch -L . -f batch-byte-compile showtip.el
  emacs -Q -batch -L . -f batch-byte-compile sdcv.el
}
package() {
 install -D -m 644 "$srcdir/showtip.el" \
    "$pkgdir/usr/share/emacs/site-lisp/showtip.el"
 install -D -m 644 "$srcdir/showtip.elc" \
    "$pkgdir/usr/share/emacs/site-lisp/showtip.elc"
 
  install -D -m 644 "$srcdir/sdcv.el" \
    "$pkgdir/usr/share/emacs/site-lisp/sdcv.el"
 install -D -m 644 "$srcdir/sdcv.elc" \
    "$pkgdir/usr/share/emacs/site-lisp/sdcv.elc"
}
