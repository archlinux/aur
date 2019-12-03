# Maintainer: Thibaut Pérami <thibaut.perami@ens.fr>

pkgname=magic_enum
pkgver=0.6.3
pkgrel=1
pkgdesc="Header-only C++17 library, provides static reflection for enums, works with any enum type without any macro or boilerplate code."
arch=('any')
url="https://github.com/Neargye/magic_enum"
license=('MIT')
makedepends=('cmake' 'wget')
source=("https://github.com/Neargye/magic_enum/archive/v0.6.3.tar.gz")
sha256sums=('5399fe9cf4894f340eb8ba04852e5ef764ad5ac546adb9a7b6bf9d3e7d94423c')

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