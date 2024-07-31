# Maintainer: Martin Diehl <aur@martin-diehl.net>
pkgname=neper
pkgver=4.9.0
pkgrel=1
pkgdesc='Polycrystal generation and meshing'
arch=('x86_64')
url='https://neper.info'
license=('GPL-3.0-only')
depends=('nlopt'
         'gmsh'
         'scotch'
         'gsl')
makedepends=('cmake')
source=(neper-${pkgver}.tar.gz::https://github.com/neperfepx/neper/archive/refs/tags/v${pkgver}.tar.gz)

sha512sums=('b4ece5a7f8608823e971164bcac16b434c56b0f9d28bae2bd0ff59828de2d42e66aa652ec9fc6de215984d1cc082c2efbe43589348381d0890eeeeac6137d285')

build() {
  cmake -S ${pkgname}-${pkgver}/src \
        -B build \
        -D CMAKE_INSTALL_PREFIX:PATH=/usr
  make -C build
}


package() {
  DESTDIR=${pkgdir} cmake --install build
}
