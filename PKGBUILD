# Maintainer: James W. Barnett <jbarnet4 at tulane dot edu>
pkgname=libgmxfort
pkgver=0.1.1
pkgrel=1
pkgdesc="A Fortran library for use in analyzing GROMACS simulation output files"
arch=(any)
url="https://github.com/wesbarnett/libgmxfort"
license=('GPL')
depends=('xdrfile')
source=(https://github.com/wesbarnett/${pkgname}/archive/${pkgver}.tar.gz)
md5sums=('4c1f2a00acdb96c57ecd1f1c8024e7e4')

build() {
  cd "${srcdir}/${pkgname}"
  make
}

check() {
  cd "${srcdir}/${pkgname}"
  make test
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="$pkgdir" install
}
