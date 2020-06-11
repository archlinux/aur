# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Frank Siegert <frank dot siegert at googlemail dot com>
pkgname=hepmc2
_pkgname=hepmc
pkgver=2.06.11
pkgrel=1
pkgdesc="A particle physics package for storing collision events from Monte Carlo generators"
arch=('x86_64')
url="http://hepmc.web.cern.ch/"
license=('GPL2')
depends=('bash')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::http://hepmc.web.cern.ch/${_pkgname}/releases/${_pkgname}${pkgver}.tgz")
sha256sums=('86b66ea0278f803cde5774de8bd187dd42c870367f1cbf6cdaec8dc7cf6afc10')

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
