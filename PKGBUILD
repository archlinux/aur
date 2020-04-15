# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=hepmc3
pkgver=3.2.1
pkgrel=1
pkgdesc="A particle physics package for storing collision events from Monte Carlo generators."
arch=('x86_64' 'i686')
url="http://hepmc.web.cern.ch/hepmc/"
license=('GPL3')
makedepends=('cmake')
optdepends=('root: ROOT I/O support')
source=("https://hepmc.web.cern.ch/hepmc/releases/HepMC3-${pkgver}.tar.gz")
noextract=()
md5sums=('8cc6cc4f13fdf8be9ed677924daea250')

build() {
        cd "$srcdir/HepMC3-$pkgver"
        mkdir -p build
        cd build
        cmake ../ -DROOT_DIR=/usr -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DHEPMC3_ENABLE_SEARCH=OFF
        make
}

package() {
        cd "$srcdir/HepMC3-$pkgver"
        cd build
	make DESTDIR="$pkgdir/" install
}
