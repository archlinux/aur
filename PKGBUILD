# Maintainer: João Freitas <joaj.freitas at gmail dot com>
# Contributor: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=plotjuggler
pkgver='3.14.5'
pkgrel=1
pkgdesc="The Time Series Visualization Tool that you deserve. Without ROS dependencies."
arch=('x86_64')
url="https://github.com/facontidavide/PlotJuggler"
license=('MPL-2.0')
depends=(
    'arrow'
    'binutils'
    'fmt'
    'lua'
    'mosquitto'
    'nlohmann-json'
    'protobuf'
    'qt5-base'
    'qt5-multimedia'
    'qt5-svg'
    'qt5-websockets'
    'qt5-x11extras'
    'zeromq'
)

makedepends=(
    'cmake'
    'clang'
)

source=(
    "${pkgname}-${pkgver}.tar.gz"::"https://github.com/facontidavide/PlotJuggler/archive/${pkgver}.tar.gz"
)

build() {
    cd "PlotJuggler-${pkgver}"
    cmake -S . -B build -DCMAKE_INSTALL_PREFIX="/usr"
    make -C build
}

package() {
    cd "PlotJuggler-${pkgver}/build"
    make DESTDIR="${pkgdir}" install
}

sha256sums=('f78b77e50fb078d658f436745b67c86f3910e4361b126676bdf383d79058de20')
sha256sums=('a65276c57b0bbf06c6f449fe6c41838e0e9196dbe4b6b87873b023c75b3e66ca')
