# Maintainer: James W. Barnett <jbarnet4 at tulane dot edu>
pkgname=libgmxfort
pkgver=0.1
pkgrel=1
pkgdesc="A Fortran library for use in analyzing GROMACS simulation output files"
arch=(any)
url="https://github.com/wesbarnett/libgmxfort"
license=('GPL')
depends=('xdrfile')
source=('https://github.com/wesbarnett/libgmxfort.git')
md5sums=('6272431de6f128d303643ee118386228')

build() {
  cd "$srcdir/libgmxfort"
  make
}

check() {
  cd "$srcdir/libgmxfort"
  make test
}

package() {
  cd "$srcdir/libgmxfort"
  make DESTDIR="$pkgdir" install
}
