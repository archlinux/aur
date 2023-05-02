# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=snitch
pkgver=1.1.1
pkgrel=1
pkgdesc="Lightweight C++20 testing framework"
arch=("x86_64")
url="https://github.com/cschreib/snitch"
license=("Boost")
depends=("gcc-libs")
makedepends=("cmake" "python")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cschreib/snitch/archive/v${pkgver}.tar.gz")
b2sums=("574eb56fbbe4df84ef12bb934b25534bb79ab0db94d8ffb861794f7569a6fd6095b42f70e66a706a743d0c6a7e9ecbf6689b69741add63580b90eddaf0e02669")

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
