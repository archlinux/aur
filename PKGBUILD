# Maintainer: Martin Diehl <aur@martin-diehl.net>
pkgname=neper
pkgver=4.8.0
pkgrel=1
pkgdesc='Polycrystal generation and meshing'
arch=('x86_64')
url='https://neper.info'
license=('GPL')
depends=('nlopt'
         'gmsh'
         'scotch'
         'gsl')
makedepends=('cmake')
source=(neper-${pkgver}.tar.gz::https://github.com/neperfepx/neper/archive/refs/tags/v${pkgver}.tar.gz)

sha512sums=('efa7d13c1e7b7e6ae719b4171119f13219085649d42ae9dfcc58dc4255bb22e5046fe405d4153dc9f13fb5e9212f6e42b0f5fe529e9fa3749c919c0149170410')

build() {
  cmake -S ${pkgname}-${pkgver}/src \
        -B build \
        -D CMAKE_INSTALL_PREFIX:PATH=/usr
  make -C build
}


package() {
  DESTDIR=${pkgdir} cmake --install build
}
