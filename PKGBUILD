# Maintainer: Graziano Giuliani <graziano.giuliani@gmail.com>
pkgname=nccmp
pkgver=1.8.5.0
pkgrel=1
pkgdesc="nccmp compares two NetCDF files bitwise or with a user defined tolerance"
arch=(i686 x86_64)
url="http://nccmp.sourceforge.net/"
license=('GPL')
groups=(science)
depends=(netcdf)
source=(https://gitlab.com/remikz/nccmp/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('4f5483ca08bb3097d434e124a04742db')
 
build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=production ..
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/build
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
