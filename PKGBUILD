# Maintainer: João Freitas <joaj.freitas at gmail dot com>
# Contributor: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=plotjuggler
pkgver='3.14.3'
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

sha256sums=('d35b27c5ab0b4c08e86411eab373bf1db9a46aa3d2ee9cb32dd0edadf1b3df69')
