# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=mpc-qt
pkgver=25.07
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
sha256sums=('8103eb0eda77021a7c0d9708a4586676f7c33328705afda91da096a1b54a520a')

build() {
  cmake -B build -S "mpc-qt-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DMPCQT_VERSION="${pkgver}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
