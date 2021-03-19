# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
# Contributor: ebiadsu
# Previous Maintainer: holos
# Contributor: Sebastien Duthil <duthils@free.fr>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-dash
pkgver=2.18.1
pkgrel=2
pkgdesc='A modern list API for Emacs'
arch=('any')
url="https://github.com/magnars/dash.el"
license=('GPL')
makedepends=('emacs')
depends=('emacs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/magnars/dash.el/archive/$pkgver.tar.gz")
sha256sums=('cb98eae83417954b9ace1dd7bf3252eae865ec1852aac50d674036fd502f1a68')

build() {
  cd dash.el-"$pkgver"
  emacs -Q -batch -L . -f batch-byte-compile dash{,-functional}.el
}

package() {
  cd dash.el-"$pkgver"
  install -d "$pkgdir"/usr/share/emacs/site-lisp/
  install -Dm644 dash{,-functional}.{el,elc} \
	  "$pkgdir"/usr/share/emacs/site-lisp
}

