# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=snitch
pkgver=1.0.0
pkgrel=1
pkgdesc="Lightweight C++20 testing framework"
arch=("x86_64")
url="https://github.com/cschreib/snitch"
license=("Boost")
depends=("gcc-libs")
makedepends=("cmake" "python")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cschreib/snitch/archive/v${pkgver}.tar.gz")
b2sums=("388dc536c87ed664c885b69290bc5e3d1cb18df2f9fccc8d7ea973f41cfd362d2a6a66685a907f67a5f7a039e50158e008d6bda0383894efe6eaa5a45a645aed")

build() {
  cmake -B "build/" -S "${pkgname}-${pkgver}" \
    -D BUILD_SHARED_LIBS:BOOL="ON" \
    -D CMAKE_INSTALL_PREFIX:PATH="/usr/" \
    -Wno-dev

  cmake --build "build/"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build/"
}
