# Maintainer: James W. Barnett <jbarnet4 at tulane dot edu>
pkgname=libgmxfort
pkgver=0.4.3
pkgrel=1
pkgdesc="A Fortran library for use in analyzing GROMACS simulation output files"
arch=(any)
url="https://github.com/wesbarnett/libgmxfort"
license=('GPL')
depends=('xdrfile')
source=(https://github.com/wesbarnett/${pkgname}/archive/${pkgver}.tar.gz)
sha512sums=('719c75f7e643a5e1a0bfbd7e034cbf2c9b4dc61816f807caadadd73f23094b4ea10aa7f174674f5bf5a78e13af380d94fa709b67fd6f911c0ef9591f8002e860')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
