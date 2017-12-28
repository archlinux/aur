# Maintainer: Nathan Osman <nathan@quickmediasolutions.com>

pkgname='qhttpengine'
pkgver='1.0.1'
pkgrel=1
pkgdesc="Simple and secure HTTP server for Qt applications"
arch=('i686' 'x86_64')
license=('MIT')
url="http://github.com/nitroshare/qhttpengine"
depends=('qt5-base')
makedepends=('cmake')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/nitroshare/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('ba75ab2540a263dbafce548f8da1c4d0')

prepare() {
    mkdir build
}

build() {
    cd build
    cmake ../${pkgname}-${pkgver} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
}
