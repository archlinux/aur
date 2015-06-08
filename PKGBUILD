# Contributor: gucong <gucong43216@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-sdcv
pkgver=0.1
pkgrel=3
pkgdesc="An extension to lookup words through sdcv (StarDict Console Version) in Emacs."
arch=('any')
url="http://code.google.com/p/sdcv-mode/"
license=('GPL')
depends=('emacs' 'sdcv')
install=$pkgname.install
source=(http://sdcv-mode.googlecode.com/svn/trunk/sdcv-mode.el)
md5sums=('3241cda6ba365e9ad9daf0a36b16ae82')

build() {
  emacs -Q -batch -L . -f batch-byte-compile sdcv-mode.el
}
package() {
  install -D -m 644 "$srcdir/sdcv-mode.el" \
    "$pkgdir/usr/share/emacs/site-lisp/sdcv-mode.el"
 install -D -m 644 "$srcdir/sdcv-mode.elc" \
    "$pkgdir/usr/share/emacs/site-lisp/sdcv-mode.elc"
}
