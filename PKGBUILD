# $Id:
# Maintainer: Ivailo Monev <xakepa10@gmail.com>

pkgname=peppermill
pkgver=1.2.0
pkgrel=1
pkgdesc='Utility to help transition from Qt4 to Copperspice'
arch=('i686' 'x86_64')
url='http://www.copperspice.com/'
license=('LGPL')
depends=('libxml2')
makedepends=('copperspice-git')
source=("http://download.copperspice.com/peppermill/source/PepperMill-${pkgver}.tar.bz2")
sha1sums=('b07b4c89b2c2d59e05cf0ae6c209dc89454c15ac')
options=('debug')


build() {
    cd PepperMill-${pkgver}

    # copperspice headers are suffixed, workaround
    export CXXFLAGS="${CXXFLAGS} -I/usr/include/copperspice -I/usr/include/copperspice/QtCore"

    ./configure --prefix=/usr \
        --disable-static
    make
}

package() {
    cd PepperMill-${pkgver}
    make DESTDIR="${pkgdir}" install
}
