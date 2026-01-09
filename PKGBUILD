# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=mpc-qt
pkgver=26.01
pkgrel=1
pkgdesc='A clone of Media Player Classic reimplemented in Qt.'
url='https://github.com/mpc-qt/mpc-qt'
arch=('x86_64')
license=('GPL-2.0-only')
depends=('mpv' 'qt6-svg')
makedepends=('boost' 'cmake' 'git' 'qt6-tools')
optdepends=('libva-intel-driver: backend for Intel cards'
            'udisks2: to detect available discs')
source=("mpc-qt-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e9c3c258358d7221e5c246ec0cc4711a1a874bc650ecc7cad9a8021cbaaa419b')

build() {
  cmake -B build -S "mpc-qt-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DMPCQT_VERSION="${pkgver}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
