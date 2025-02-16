# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=sfl
pkgver=1.9.1
pkgrel=1
pkgdesc="C++11 header-only library. Small and static vector. Small and static flat map/set. Compact vector. Segmented vector"
arch=(any)
url="https://github.com/slavenf/sfl-library"
license=(Zlib)
makedepends=(git cmake)
source=("git+https://github.com/slavenf/sfl-library.git#tag=${pkgver}")
sha256sums=('998fde0d43b282da5a57231e0e2104fee913c29eedf00ac538dc728b540972f4')

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
