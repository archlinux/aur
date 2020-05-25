# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Frank Siegert <frank dot siegert at googlemail dot com>
pkgname=hepmc2
_pkgname=hepmc
pkgver=2.06.10
pkgrel=1
pkgdesc="A particle physics package for storing collision events from Monte Carlo generators"
arch=('x86_64')
url="http://hepmc.web.cern.ch/"
license=('GPL2')
depends=('bash')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::http://hepmc.web.cern.ch/${_pkgname}/releases/${_pkgname}${pkgver}.tgz")
sha256sums=('5adedd9e3f7447e1e5fc01b72f745ab87da2c1611df89208bb3d7c6ea94c11a4')

build() {
    mkdir build
    cd build
    cmake "${srcdir}/HepMC-${pkgver}" -DCMAKE_INSTALL_PREFIX:PATH=/usr -Dmomentum=GEV -Dlength=MM
    make
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
}
