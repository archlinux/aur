# Maintainer: Martin Diehl <aur@martin-diehl.net>
pkgname=neper
pkgver=4.7.0
pkgrel=3
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

sha512sums=('ce73bbc3d1c0a6eae8956559431e910df3f84ec14317f6653163799982780b4bd952ee3d7ab0138b9ff4d7796a88e3d948242e8747e235f458e77d9f3e7c43db')

build() {
  cmake -S ${pkgname}-${pkgver}/src \
        -B build \
        -D CMAKE_INSTALL_PREFIX:PATH=/usr
  make -C build
}


package() {
  DESTDIR=${pkgdir} cmake --install build
}
