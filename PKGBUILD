# Maintainer: Thibaut Pérami <thibaut.perami@ens.fr>

pkgname=magic_enum
pkgver=0.6.5
pkgrel=1
pkgdesc="Header-only C++17 library, provides static reflection for enums, works with any enum type without any macro or boilerplate code."
arch=('any')
url="https://github.com/Neargye/magic_enum"
license=('MIT')
makedepends=('cmake' 'wget')
source=("https://github.com/Neargye/magic_enum/archive/v0.6.5.tar.gz")
sha256sums=('37a69482517c8976cb48cd271da8c6ba92e07ee2ab2bdd7caef4c8158af77359')

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
