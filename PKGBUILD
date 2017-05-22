# Maintainer: Graziano Giuliani <graziano.giuliani@gmail.com>
pkgname=nccmp
pkgver=1.8.2.0
pkgrel=1
pkgdesc="nccmp compares two NetCDF files bitwise or with a user defined tolerance"
arch=(i686 x86_64)
url="http://nccmp.sourceforge.net/"
license=('GPL')
groups=(science)
depends=(netcdf)
source=(http://prdownloads.sourceforge.net/nccmp/${pkgname}-${pkgver}.tar.gz isnan.patch)
md5sums=('81e6286d4413825aec4327e61a28a580'
         '12643e14abdf802fabd227e3a2cadfad')
 
build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch -p0 -i ${srcdir}/isnan.patch
  ./configure --prefix=/usr --program-transform-name='s/info/desc/'
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
