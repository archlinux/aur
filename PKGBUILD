# Maintainer: Pato05 <pato05mc@gmail.com>

pkgname=cppbtbl
pkgver=0.2.0
pkgrel=1
pkgdesc="A C++ wrapper around the UPower DBus API to get bluetooth devices' battery"
url="https://github.com/pato05/cppbtbl"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('MIT')
depends=('sdbus-cpp')
makedepends=('cmake' 'make')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pato05/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('1c8ddecd8d7d8b94c506424c319e2178f69ba0e09508499100aa8cf0b3878f968858244beb0cc23a0a6ea8a493382d319b1a6415f92b1a38582855105c772874')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake "../${pkgname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make install DESTDIR="$pkgdir"
}

