# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=functionalplus
pkgver=0.2.25
pkgrel=1
pkgdesc="Functional Programming Library for C++"
arch=("any")
url="https://www.editgym.com/fplus-api-search"
license=("BSL-1.0")
makedepends=("python")
source=("${pkgname}-${pkgver}::https://github.com/Dobiasd/FunctionalPlus/archive/v${pkgver//_/-}.tar.gz")
b2sums=("55bc82e2251836b409e23eb2a691b244a613a39976f5392624208096a204d4a98611d3040f3e9f7365af987eb3daad99d5cb53c77695119330c652fda1f4364e")

build() {
  cmake -B "build/" -S "FunctionalPlus-${pkgver//_/-}" \
    -D CMAKE_INSTALL_PREFIX:PATH="/usr/" \
    -Wno-dev

  cmake --build "build/"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build/"
}
