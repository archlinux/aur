# Maintainer:  Florian Lindner <florian.lindner@xgm.de>

pkgname=precice
pkgver=1.2.0
pkgrel=1
pkgdesc="A Coupling Library for Partitioned Multi-Physics Simulations on Massively Parallel Systems"
arch=('x86_64')
url="https://www.precice.org"
license=('LGPL3')
depends=('openmpi' 'boost')
makedepends=('cmake')
optdepends=('')
provides=('precice')
source=("https://github.com/precice/precice/archive/v${pkgver}.tar.gz")
sha256sums=('0784ecd002092949835151b90393beb6e9e7a3e9bd78ffd40d18302d6da4b05b')

build() {
    cd "${pkgname}-${pkgver}"
    cmake . \
	  -DCMAKE_BUILD_TYPE=Release \
	  -DCMAKE_INSTALL_PREFIX=/usr \
          -DPETSC=off \
          -DPYTHON=off
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}/" install
}
