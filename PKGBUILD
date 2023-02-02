# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=functionalplus
pkgver=0.2.18_p0
pkgrel=1
pkgdesc="Functional Programming Library for C++"
arch=("any")
url="https://www.editgym.com/fplus-api-search"
license=("Boost")
makedepends=("python")
source=("${pkgname}-${pkgver}::https://github.com/Dobiasd/FunctionalPlus/archive/v${pkgver//_/-}.tar.gz")
b2sums=("ae2ab62921d6c57ff977e3d4c4eb55cfaa42d9f5ab2790ab381df406b287bd1d197d0d397749ea25fd84d67e6575484ba1fd7677215e66c18ebfb50484faef79")

build() {
  cmake -B "build/" -S "FunctionalPlus-${pkgver//_/-}" \
    -D CMAKE_INSTALL_PREFIX:PATH="/usr/" \
    -Wno-dev

  cmake --build "build/"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build/"
}
