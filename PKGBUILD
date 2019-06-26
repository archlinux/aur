# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Frank Siegert <frank dot siegert at googlemail dot com>
pkgname=hepmc
pkgver=2.06.09
pkgrel=5
pkgdesc="A particle physics package for storing collision events from Monte Carlo generators"
arch=('x86_64')
url="http://lcgapp.cern.ch/project/simu/HepMC/"
license=('GPL2')
depends=('bash')
source=("http://lcgapp.cern.ch/project/simu/HepMC/download/HepMC-${pkgver}.tar.gz")
sha256sums=('c60724ca9740230825e06c0c36fb2ffe17ff1b1465e8656268a61dffe1611a08')

build() {
    cd "${srcdir}/HepMC-${pkgver}"
    ./configure --prefix=/usr --with-momentum=GEV --with-length=MM
    make
}

package() {
    cd "${srcdir}/HepMC-${pkgver}"
    make DESTDIR="${pkgdir}/" install
}
