# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=falkon-plugin-pdfreader
pkgver=0.2
pkgrel=2
pkgdesc='PDF reader extension for falkon'
arch=(x86_64)
url='https://github.com/gustawho/PDFReader/'
license=('GPL-3.0-or-later' 'Apache-2.0')
depends=('falkon')
makedepends=('git' 'extra-cmake-modules')
provides=("${pkgname}")
source=("${pkgname}::git+${url}")
md5sums=('SKIP')

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -B build -S "${pkgname}"
  cmake --build build --config Release
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config Release
}
