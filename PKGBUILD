# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=functionalplus
pkgver=0.2.22
pkgrel=1
pkgdesc="Functional Programming Library for C++"
arch=("any")
url="https://www.editgym.com/fplus-api-search"
license=("Boost")
makedepends=("python")
source=("${pkgname}-${pkgver}::https://github.com/Dobiasd/FunctionalPlus/archive/v${pkgver//_/-}.tar.gz")
b2sums=("dd32e0c518d3b18dd7f31498579edb05cd8a73108c4720db560b48931ed50d8a1a970916d517d488188cdfd69d04d2a3bc6dbfe193b5b8adf114ee7a2938208c")

build() {
  cmake -B "build/" -S "FunctionalPlus-${pkgver//_/-}" \
    -D CMAKE_INSTALL_PREFIX:PATH="/usr/" \
    -Wno-dev

  cmake --build "build/"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build/"
}
