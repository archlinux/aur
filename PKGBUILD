# Maintainer: Pato05 <pato05mc@gmail.com>

pkgname=cppbtbl
pkgver=0.2.1
pkgrel=0
pkgdesc="A C++ wrapper around the UPower DBus API to get bluetooth devices' battery"
url="https://github.com/pato05/cppbtbl"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('MIT')
depends=('sdbus-cpp')
makedepends=('cmake' 'make')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pato05/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('c1419585cde85431c6c5fd181ddd4d00daadb932dd4d2d083f53978ac18757dbf5e3e26ecdfdb07e33418853586f15695f90acac4d442cb63fecdc757b3b2cf6')

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

