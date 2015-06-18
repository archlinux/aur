# Contributor: Bernhard Walle <bernhard@bwalle.de>
# AUR Category: devel

pkgname=ptxdist
pkgver=2015.06.0
pkgrel=1
pkgdesc="Embedded Linux build system"
arch=('i686' 'x86_64')
url="http://www.ptxdist.org"
license=('GPL')
depends=('dialog' 'flex' 'bison' 'patch' 'python2')
source=("http://www.pengutronix.de/software/ptxdist/download/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('508c7b32b72cf80cb1c9e85e191daddd4672c1bdbc189b25f7f2035125fd4e03')
sha512sums=('6bcbd1c864c4858fad0001d2d94950d64b0a286fa4e9c4c047f8562a3e9a9e60193da5015339c1ce8e85fa9b59da9274538a2aec1f199582acdc2bb6db26308c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-python=/usr/bin/python2
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
