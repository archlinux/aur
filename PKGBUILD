# Maintainer: Malte Jürgens <maltejur@dismail.de>

pkgname=ath
pkgver=1.0.0
pkgrel=1
pkgdesc="command line tool for converting text containing ANSI escape sequences into HTML"
arch=("x86_64")
url="https://github.com/maltejur/ath"
license=("LGPL-3.0")
makedepends=(ldc dub)
source=("$pkgname-$pkgver.tar.gz::https://github.com/maltejur/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("c9b776c4d480be3cfafd7f14a6b374dae67d3420625f99c5bd338a54c6e7b9a4")

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  mkdir -p "$pkgdir/usr/bin"
  cp -v ./ath "$pkgdir/usr/bin"
}
