# Maintainer: James W. Barnett <jbarnet4 at tulane dot edu>
pkgname=libgmxfort
pkgver=0.3.1
pkgrel=1
pkgdesc="A Fortran library for use in analyzing GROMACS simulation output files"
arch=(any)
url="https://github.com/wesbarnett/libgmxfort"
license=('GPL')
depends=('xdrfile')
source=(https://github.com/wesbarnett/${pkgname}/archive/${pkgver}.tar.gz)
sha512sums=('e28f3f7c0095c23c0b1254a4a168f75c5dac44f6c431cb23e0f0e15123547b4c3e7e1de6cfa59050857f1a4ee64ed71870c8bdc9894d7c73317101139e0b997a')

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
