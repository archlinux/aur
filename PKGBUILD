# Maintainer: Thibaut Pérami <thibaut.perami@ens.fr>

pkgname=magic_enum
pkgver=0.6.6
pkgrel=1
pkgdesc="Header-only C++17 library, provides static reflection for enums, works with any enum type without any macro or boilerplate code."
arch=('any')
url="https://github.com/Neargye/magic_enum"
license=('MIT')
makedepends=('cmake' 'wget')
source=("https://github.com/Neargye/magic_enum/archive/v${pkgver}.tar.gz")
sha256sums=('1033f9a9315023feebb48f20d5a572149ec72c1e95a52bcf7042a412ff9d2e28')

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
