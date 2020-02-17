# Contributor: ebiadsu
# Previous Maintainer: holos
# Contributor: Sebastien Duthil <duthils@free.fr>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-dash
pkgver=2.17.0
pkgrel=1
pkgdesc='A modern list API for Emacs'
arch=('any')
url="https://github.com/magnars/dash.el"
license=('GPL')
makedepends=('emacs')
depends=('emacs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/magnars/dash.el/archive/$pkgver.tar.gz")
sha256sums=('9db9f70a41ad50e87d0ecf681607290284809f3f24cf36fba0d38b0019aabfa0')

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

