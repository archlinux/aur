# Contributor: Andreas Baumann <abaumann@yahoo.com>

pkgname=gzstream
pkgver=1.5
pkgrel=2
pkgdesc="C++ wrapper providing stream classes for zlib"
arch=('i686' 'x86_64')
url="http://www.cs.unc.edu/Research/compgeom/gzstream"
depends=('zlib>=1.1.3')
license=('LGPL')
source=(http://www.cs.unc.edu/Research/compgeom/${pkgname}/${pkgname}.tgz)
md5sums=('74a0beaa4e185b883993d537a7019a53')
OPTIONS=(!strip)

build() {
  cd ${srcdir}/${pkgname}

  make
}

package() {
  cd ${srcdir}/${pkgname}

  install -Dm 644 libgzstream.a ${pkgdir}/usr/lib
  install -Dm 644 gzstream.h ${pkgdir}/usr/include
}
