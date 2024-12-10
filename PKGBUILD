# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
# Contributor: Hauke Wesselmann <hauke@h-dawg.de>
# Contributor: xgdgsc <xgdgsc at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-js2-mode
pkgver=20231224
pkgrel=1
pkgdesc="An improved JavaScript mode for GNU Emacs"
arch=('any')
url="https://github.com/mooz/js2-mode/"
license=('GPL2')
depends=('emacs')
source=($pkgname-$pkgver.tar.gz::https://github.com/mooz/js2-mode/archive/$pkgver.tar.gz)
sha256sums=('b208a3734e65f40ec807b64276fe6e2d7d71d1627bb8dca3fb416c22adc63763')

build() {
  cd ${pkgname#emacs-}-$pkgver
  make
}

package() {
  cd ${pkgname#emacs-}-$pkgver
  install -Dm644 js2-mode.el "$pkgdir"/usr/share/emacs/site-lisp/js2-mode.el
  install -Dm644 js2-mode.elc "$pkgdir"/usr/share/emacs/site-lisp/js2-mode.elc
  install -Dm644 js2-old-indent.el "$pkgdir"/usr/share/emacs/site-lisp/js2-old-indent.el
  install -Dm644 js2-imenu-extras.el \
	  "$pkgdir"/usr/share/emacs/site-lisp/js2-imenu-extras.el
  install -Dm644 js2-imenu-extras.elc \
	  "$pkgdir"/usr/share/emacs/site-lisp/js2-imenu-extras.elc
}
