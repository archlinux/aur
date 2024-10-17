# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=sfl
pkgver=1.8.0
pkgrel=1
pkgdesc="C++11 header-only library. Small and static vector. Small and static flat map/set. Compact vector. Segmented vector"
arch=(any)
url="https://github.com/slavenf/sfl-library"
license=(Zlib)
makedepends=(git cmake)
source=("git+https://github.com/slavenf/sfl-library.git#tag=${pkgver}")
sha256sums=('3c8e02feee73fb99be3ada484fa9d9408f3befddacf68ec3e9bca1cd93d3251b')

build() {
  cmake -B build -S "sfl-library" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -D sfl-library/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
