# Contributor: Hauke Wesselmann <hauke@h-dawg.de>
# Contributor: xgdgsc <xgdgsc at gmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-js2-mode
pkgver=20190219
pkgrel=1
pkgdesc="An improved JavaScript mode for GNU Emacs"
arch=('any')
url="https://github.com/mooz/js2-mode/"
license=('GPL2')
depends=('emacs')
source=($pkgname-$pkgver.tar.gz::https://github.com/mooz/js2-mode/archive/$pkgver.tar.gz)
sha256sums=('718b8b8d582f52782b33fafc1921944dd79d4e67ce21ab8cb5762b716ddc61bf')

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
