# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=functionalplus
pkgver=0.2.24
pkgrel=1
pkgdesc="Functional Programming Library for C++"
arch=("any")
url="https://www.editgym.com/fplus-api-search"
license=("BSL-1.0")
makedepends=("python")
source=("${pkgname}-${pkgver}::https://github.com/Dobiasd/FunctionalPlus/archive/v${pkgver//_/-}.tar.gz")
b2sums=("13b1cb64c0d464ac6080da570ec63f918c7fa9d5ef0f89f031c7d451bc0ce0045341025c1acb6f7adc4ad249e5e6306575549efc2797ae59401767cdebf054bb")

build() {
  cmake -B "build/" -S "FunctionalPlus-${pkgver//_/-}" \
    -D CMAKE_INSTALL_PREFIX:PATH="/usr/" \
    -Wno-dev

  cmake --build "build/"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build/"
}
