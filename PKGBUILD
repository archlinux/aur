# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=directxmath
pkgdesc="All inline SIMD C++ linear algebra library for use in games and graphics apps"
# Version from CMakeLists.txt.
pkgver=3.1.8
_tag=dec2023
pkgrel=2
arch=('x86_64')
depends=('sal')
makedepends=('cmake')
url="https://go.microsoft.com/fwlink/?LinkID=615560"
license=('MIT')
options=('staticlibs' '!strip')
source=(directxmath-${_tag}.tar.gz::https://github.com/microsoft/DirectXMath/archive/refs/tags/${_tag}.tar.gz)
sha256sums=('cdc09f55a9999497d8c350d1c8c0e3f0fe92055cbf5490a2c319f9625080dc13')

build() {
  cmake -S DirectXMath-$_tag -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  cmake --build build/${_arch}
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
