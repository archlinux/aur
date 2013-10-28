#Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgdesc="Library for collision detection between two convex shapes."
url='http://libccd.danfis.cz/'
pkgname=libccd
pkgver=1.4
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('cmake')
depends=()
source=(http://libccd.danfis.cz/files/libccd-${pkgver}.tar.gz)
md5sums=('684a9f2f44567a12a30af383de992a89')
provides=('libccd')
conflicts=('libccd-git')

_dir=libccd-${pkgver}

build() {
    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
    cd ${srcdir}/build
    cmake ${srcdir}/${_dir} -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
}
