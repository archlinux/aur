# Maintainer: James W. Barnett <jbarnet4@tulane.edu>
pkgname=xdrfile
pkgver=2.1.2
pkgrel=1
pkgdesc='Reads/writes compressed trajectory files.'
license=("GPL")
arch=('i686' 'x86_64')
source=(https://github.com/wesbarnett/lib${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('c0f137593def97354a71d783733fde572886a903a4fc9b01449000cf8167bfa3')

prepare() {
    cd ${srcdir}/lib${pkgname}-${pkgver}
    mkdir build
    cd build
    cmake ..  -DCMAKE_INSTALL_PREFIX=/usr
}

build() {
    cd ${srcdir}/lib${pkgname}-${pkgver}/build
    make
}

check() {
    cd ${srcdir}/lib${pkgname}-${pkgver}/build
    make test
}

package() {
    cd ${srcdir}/lib${pkgname}-${pkgver}/build
    make DESTDIR=${pkgdir} install
}
