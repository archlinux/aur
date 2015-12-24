# Maintainer: Graziano Giuliani <graziano.giuliani@gmail.com>
pkgname=nccmp
pkgver=1.7.5.1
pkgrel=1
pkgdesc="nccmp compares two NetCDF files bitwise or with a user defined tolerance"
arch=(i686 x86_64)
url="http://nccmp.sourceforge.net/"
license=('GPL')
groups=(science)
depends=(netcdf)
source=(http://prdownloads.sourceforge.net/nccmp/${pkgname}-${pkgver}.tar.gz)

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --program-transform-name='s/info/desc/'
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
md5sums=('597fb2036811fa3981f1ccd761e181e4')
