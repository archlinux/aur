# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=functionalplus
pkgver=0.2.27
pkgrel=1
pkgdesc="Functional Programming Library for C++"
arch=("any")
url="https://www.editgym.com/fplus-api-search"
license=("BSL-1.0")
makedepends=("python")
source=("${pkgname}-${pkgver}::https://github.com/Dobiasd/FunctionalPlus/archive/v${pkgver//_/-}.tar.gz")
b2sums=("6dd54bad34306e51375a019b131546ecda06b6b9a55bf5cde4a0bfd2405638d2e63775091b4acdec9260dd114050b775afc19bc99c5e7efeefde4ed3d12efae4")

build() {
  cmake -B "build/" -S "FunctionalPlus-${pkgver//_/-}" \
    -D CMAKE_INSTALL_PREFIX:PATH="/usr/" \
    -Wno-dev

  cmake --build "build/"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build/"
}
