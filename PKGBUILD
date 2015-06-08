# Contributor: Hauke Wesselmann <hauke@h-dawg.de>
# Contributor: xgdgsc <xgdgsc at gmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-js2-mode
pkgver=20121128
pkgrel=1
pkgdesc="An improved JavaScript mode for GNU Emacs"
arch=('any')
url="http://code.google.com/p/js2-mode/"
license=('GPL2')
depends=('emacs')
source=(https://js2-mode.googlecode.com/files/js2-mode.el)
md5sums=('4635201397803fd4b705b285f77b2321')

build() {
  cd $srcdir
  emacs -batch -q -f batch-byte-compile js2-mode.el
}
package() {
  install -Dm644 $srcdir/js2-mode.el $pkgdir/usr/share/emacs/site-lisp/js2-mode.el
  install -Dm644 $srcdir/js2-mode.elc $pkgdir/usr/share/emacs/site-lisp/js2-mode.elc
}
