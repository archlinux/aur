# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=directxmath
pkgdesc="All inline SIMD C++ linear algebra library for use in games and graphics apps"
# Version from CMakeLists.txt.
pkgver=3.20
_tag=apr2025
pkgrel=1
arch=('x86_64')
depends=('sal')
makedepends=('cmake')
url="https://go.microsoft.com/fwlink/?LinkID=615560"
license=('MIT')
options=('staticlibs' '!strip')
source=(directxmath-${_tag}.tar.gz::https://github.com/microsoft/DirectXMath/archive/refs/tags/${_tag}.tar.gz)
sha256sums=('8ac7f060d7fcc971d77c5a9f3ff98548ecf119c144a7c2dd9d21f4b66ba94cd4')

build() {
  cmake -S DirectXMath-$_tag -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  cmake --build build/${_arch}
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
