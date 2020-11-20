# Maintainer: Thibaut Pérami <thibaut.perami@ens.fr>

pkgname=magic_enum
pkgver=0.7.0
pkgrel=1
pkgdesc="Header-only C++17 library, provides static reflection for enums, works with any enum type without any macro or boilerplate code."
arch=('any')
url="https://github.com/Neargye/magic_enum"
license=('MIT')
makedepends=('cmake' 'wget')
source=("https://github.com/Neargye/magic_enum/archive/v${pkgver}.tar.gz")
sha256sums=('4fe6627407a656d0d73879c0346b251ccdcfb718c37bef5410ba172c7c7d5f9a')

build() {
  cd "${pkgname}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B build
  cmake --build build
}

check(){
  cd "${pkgname}-${pkgver}/build"
  make test
}

package() {
  cd "${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}
