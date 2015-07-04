# Maintainer: Graziano Giuliani <graziano.giuliani@gmail.com>
pkgname=nccmp
pkgver=1.4.0
pkgrel=1
pkgdesc="nccmp compares two NetCDF files bitwise or with a user defined tolerance"
arch=(i686 x86_64)
url="http://nccmp.sourceforge.net/"
license=('GPL')
groups=(science)
depends=(netcdf)
source=(http://prdownloads.sourceforge.net/nccmp/${pkgname}-${pkgver}.tgz)
md5sums=('d75a34542c5665999d611bd95ab7fdee')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
