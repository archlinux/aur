# Maintainer: James W. Barnett <jbarnet4 at tulane dot edu>
pkgname=libgmxfort
pkgver=0.3.1
pkgrel=2
pkgdesc="A Fortran library for use in analyzing GROMACS simulation output files"
arch=(any)
url="https://github.com/wesbarnett/libgmxfort"
license=('GPL')
depends=('xdrfile')
source=(https://github.com/wesbarnett/${pkgname}/archive/${pkgver}.tar.gz)
sha512sums=('aeb0026b04620bc1110d06f81183c3a6459ceb06d12904f1728b780b851b2d1dd812157ff5f8beb637e82d67e63db8752bb58b70bc3ed03286d25df7e018e39d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -j 1
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
