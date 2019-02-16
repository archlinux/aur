# Contributor: ebiadsu
# Previous Maintainer: holos
# Contributor: Sebastien Duthil <duthils@free.fr>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-dash
pkgver=2.15.0
pkgrel=1
pkgdesc='A modern list API for Emacs'
arch=('any')
url="https://github.com/magnars/dash.el"
license=('GPL')
makedepends=('emacs')
depends=('emacs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/magnars/dash.el/archive/$pkgver.tar.gz")
sha256sums=('8e0f91346a12882a1c94f57f23d0a827b45e760c6e3cf98d94cb7c5425bdf71f')

build() {
  cd dash.el-"$pkgver"
  emacs -Q -batch -L . -f batch-byte-compile dash{,-functional}.el
}

package() {
  cd dash.el-"$pkgver"
  install -d "$pkgdir"/usr/share/emacs/site-lisp/
  install -Dm644 dash{,-functional}.{el,elc} \
	  "$pkgdir"/usr/share/emacs/site-lisp
  install -Dm644 dash.info "$pkgdir"/usr/share/info/dash.info
}

