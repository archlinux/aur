# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=directxmath
pkgdesc="All inline SIMD C++ linear algebra library for use in games and graphics apps"
pkgver=dec2022
pkgrel=3
arch=('x86_64')
depends=('sal')
makedepends=('cmake')
url="https://go.microsoft.com/fwlink/?LinkID=615560"
license=('MIT')
options=('staticlibs' '!strip')
source=(directxmath-${pkgver}.tar.gz::https://github.com/microsoft/DirectXMath/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('70a18f35343ff07084d31afa7a7978b3b59160f0533424365451c72475ff480f')


build() {
  cmake -S DirectXMath-$pkgver -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  cmake --build build/${_arch}
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
