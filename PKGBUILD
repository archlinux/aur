# Maintainer: Graziano Giuliani <graziano.giuliani@gmail.com>
pkgname=netcdf-cxx-legacy
spkgname=netcdf-cxx
pkgver=4.2
pkgrel=1
pkgdesc="Backward compatible netCDF C++ library"
arch=(i686 x86_64)
url="http://nccmp.sourceforge.net/"
license=('GPL')
groups=(science)
depends=(netcdf)
source=(ftp://ftp.unidata.ucar.edu/pub/netcdf/${spkgname}-${pkgver}.tar.gz)
md5sums=('d32b20c00f144ae6565d9e98d9f6204c')

build() {
  cd ${srcdir}/${spkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${spkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
