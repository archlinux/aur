# Contributor: Hauke Wesselmann <hauke@h-dawg.de>
# Contributor: xgdgsc <xgdgsc at gmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-js2-mode
pkgver=20170721
pkgrel=1
pkgdesc="An improved JavaScript mode for GNU Emacs"
arch=('any')
url="http://code.google.com/p/js2-mode/"
license=('GPL2')
depends=('emacs')
source=($pkgname-$pkgver.tar.gz::https://github.com/mooz/js2-mode/archive/$pkgver.tar.gz)
md5sums=('d3c5430af92b6a51103d10635a4ea9a0')

build() {
  cd "$srcdir"/${pkgname#emacs-}-$pkgver
  make
}
package() {
  cd "$srcdir"/${pkgname#emacs-}-$pkgver
  install -Dm644 js2-mode.el "$pkgdir"/usr/share/emacs/site-lisp/js2-mode.el
  install -Dm644 js2-mode.elc "$pkgdir"/usr/share/emacs/site-lisp/js2-mode.elc
  install -Dm644 js2-old-indent.el "$pkgdir"/usr/share/emacs/site-lisp/js2-old-indent.el
  install -Dm644 js2-imenu-extras.el \
	  "$pkgdir"/usr/share/emacs/site-lisp/js2-imenu-extras.el
  install -Dm644 js2-imenu-extras.elc \
	  "$pkgdir"/usr/share/emacs/site-lisp/js2-imenu-extras.elc
}
