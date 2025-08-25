# Maintainer: Haoyuan Li <lihaoyuan0506@gmail.com>
pkgname=hitpag
pkgver=2.0.1
pkgrel=1
pkgdesc="An intelligent compression/decompression software."
arch=('x86_64')
url="https://github.com/Hitmux/hitpag"
license=('AGPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Hitmux/hitpag/archive/refs/tags/v2.0.1.tar.gz")
sha256sums=('SKIP')
depends=()
makedepends=('cmake' 'make')
options=('!debug')

build() {
  cd "$srcdir"
  tar -xzf "$pkgname-$pkgver".tar.gz
  cd "$pkgname-$pkgver"
  mkdir -p build
  cd build
  cmake ..
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  install -Dm755 hitpag "$pkgdir/usr/bin/hitpag"
}
