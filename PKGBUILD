#Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgdesc="Flexible Collision Library."
url='https://github.com/flexible-collision-library'
pkgname=fcl
pkgver=0.2.9
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('cmake')
depends=('boost' 'libccd')
optdepends=('octomap: collision detection with octrees'
            'tinyxml: support for global penetration depth test'
            'flann: support for fast approximate nearest neighbor searches')
_dir=fcl-${pkgver}
source=(https://github.com/flexible-collision-library/fcl/archive/${pkgver}.tar.gz)
md5sums=('SKIP')

build() {
    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
    cd ${srcdir}/build
    cmake ${srcdir}/${_dir} -DCMAKE_INSTALL_PREFIX=/usr
    make
}

#check() {
#    cd "${srcdir}/build/test"
#    make test
#}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
}
