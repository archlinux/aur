# Maintainer: Thibaut Pérami <thibaut.perami@ens.fr>

pkgname=magic_enum
pkgver=0.7.2
pkgrel=1
pkgdesc="Header-only C++17 library, provides static reflection for enums, works with any enum type without any macro or boilerplate code."
arch=('any')
url="https://github.com/Neargye/magic_enum"
license=('MIT')
makedepends=('cmake' 'wget')
source=("https://github.com/Neargye/magic_enum/archive/v${pkgver}.tar.gz")
sha256sums=('a77895ebc684f7a4dd2e4e06529b22e9ae694037f6dee0753d3ce0bbcd5b3e38')

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
