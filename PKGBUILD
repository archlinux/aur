# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
# Contributor: ebiadsu
# Previous Maintainer: holos
# Contributor: Sebastien Duthil <duthils@free.fr>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-dash
pkgver=2.19.1
pkgrel=1
pkgdesc='A modern list API for Emacs'
arch=('any')
url="https://github.com/magnars/dash.el"
license=('GPL')
makedepends=('emacs')
depends=('emacs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/magnars/dash.el/archive/$pkgver.tar.gz")
sha256sums=('37a8e562934ed4a6537db5f4fd83d7d472d0867f9c4749e8d21e6c5e4ae8bbae')

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

