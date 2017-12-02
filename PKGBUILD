# Maintainer: Nathan Osman <nathan@quickmediasolutions.com>

pkgname='win32pe'
pkgver='0.1.0'
pkgrel=1
pkgdesc="C++ library for working with Win32 PE files"
arch=('i686' 'x86_64')
license=('MIT')
url="http://github.com/nathan-osman/win32pe"
makedepends=('cmake' 'boost>=1.58')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/nathan-osman/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('479a8ca8b84c30ff0737d43ab0c80d843c1870d76e77186ad0034e2f9de9eb5e')

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