# Maintainer: Nathan Osman <nathan@quickmediasolutions.com>

pkgname='qmdnsengine'
pkgver='0.1.0'
pkgrel=1
pkgdesc="Simple multicast DNS library for Qt applications"
arch=('i686' 'x86_64')
license=('MIT')
url='https://github.com/nitroshare/qmdnsengine'
depends=('qt5-base')
makedepends=('cmake')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/nitroshare/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('6e32705e8e3febf4e4c3b08a7f065262')

prepare() {
    mkdir build
}

build() {
    cd build
    cmake ../${pkgname}-${pkgver} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
}
