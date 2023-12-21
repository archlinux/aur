# Maintainer: Martin Diehl <aur@martin-diehl.net>
pkgname=neper
pkgver=4.7.0
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
source=(https://github.com/rquey/neper/archive/v${pkgver}.tar.gz)

sha256sums=('56189f274bd3cae0369ec807b7e3e7ed2672da236e900ae3a49eb7c3a21199cc')

build() {
  cmake -S ${pkgname}-${pkgver}/src \
        -B build \
        -D CMAKE_INSTALL_PREFIX:PATH=/usr
  cmake --build build --parallel 4
}


package() {
  DESTDIR=${pkgdir} cmake --install build
}
