#Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgdesc="Library for collision detection between two convex shapes. Git version."
url='http://libccd.danfis.cz/'
pkgname=libccd-git
pkgver=20131028
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('cmake')
depends=()
_dir=libccd
source=("$_dir"::'git://github.com/danfis/libccd.git'#branch=master)
md5sums=('SKIP')
provides=('libccd')
conflicts=('libccd')

pkgver() {
    date +%Y%m%d
}

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
