# Maintainer: Remisa Phillips <remisa.yousefvand@gmail.com>
pkgname=zipplay
pkgver=0.1.0
pkgrel=1
_tag='0.1.0'
pkgdesc='Qt 6 utility for splitting and recombining ZIP, TAR.GZ, and arbitrary files'
arch=('x86_64')
url='https://github.com/yousefvand/zipplay'
license=('MIT')
depends=('qt6-base' 'zip' 'hicolor-icon-theme')
makedepends=('cmake' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz")
sha256sums=('1cd73ebc4826e7826e5925868ea84c4f2d88446fb5cc3f99c28ca604245a1768')

build() {
    cmake -S "zipplay-${_tag}" -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
