# Maintainer: Simon Wilper <sxw@chronowerks.de>

pkgname=libplctag
pkgver=2.7.2
pkgrel=1
pkgdesc='Portable and simple API for accessing Allen-Bradley and Modbus PLC data over Ethernet.'
arch=('x86_64')
url="https://github.com/kyle-github/$pkgname"
license=('GPL')
makedepends=('cmake')
source=(
  "$url/archive/v$pkgver.tar.gz"
  )

prepare() {
  cd "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  mkdir build && cd build

  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr ".."

  make
}

package() {
  cd "$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install
}
sha256sums=('09057d893a418e10c977267fe57a0195a4b8a4d7e512acc2d9ccef0314823056')
