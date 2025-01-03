# Maintainer: Martin Diehl <aur@martin-diehl.net>

pkgname=neper
pkgver=4.10.1
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
source=("https://github.com/neperfepx/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('48e21f908702550aaf20b5cf8598fdd810fc4103f7725a8d07276cdda98c72a73d972dc16f87fd42cb24992b897fa5ee987342129b28f28f6f758609c32809a3')

build() {
  cmake -S "${pkgname}-${pkgver}"/src \
        -B build \
        -D CMAKE_INSTALL_PREFIX:PATH=/usr
  make -C build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
