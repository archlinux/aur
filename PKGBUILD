# Maintainer:
# Contributer: giacomogiorgianni@gmail.com

pkgname=httraqt
pkgver=1.4.11
pkgrel=1
pkgdesc="Graphical user interface (GUI) for HTTrack library"
arch=('x86_64')
url="https://httraqt.sourceforge.net"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'httrack' 'qt6-base')
makedepends=('cmake' 'qt6-multimedia')
source=("https://downloads.sourceforge.net/project/httraqt/${pkgname}-${pkgver}.tar.gz")
sha256sums=('1df9d494989fa735a23f5adbf8a9f723f1fa9d805e101e9c5d5239a6edbc2b91')

build() {
    cmake -B build -S "${pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
