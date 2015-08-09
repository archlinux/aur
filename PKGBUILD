# Maintainer: Jonathan Squirawski <sky@sky-co.de>

pkgname=shapelib-tools
pkgver=1.3.0
pkgrel=2
pkgdesc='Several utilities to manipulate ESRI Shapefiles'
arch=('i686' 'x86_64')
url='http://shapelib.maptools.org/'
license=('LGPL')
depends=("shapelib>=${pkgver}" 'proj')
options=('!libtool')
source=("http://download.osgeo.org/shapelib/shapelib-${pkgver}.tar.gz")
md5sums=('2ff7d0b21d4b7506b452524492795f77')

build() {
  cd shapelib-$pkgver
  make
  make -C contrib
}

package(){
  cd shapelib-$pkgver

  install -d "$pkgdir/usr/bin"
  install -m755 -t "$pkgdir/usr/bin" shpcreate shpadd shpdump shprewind dbfcreate dbfadd dbfdump

  cd contrib
  install -m755 -t "$pkgdir/usr/bin" dbfinfo dbfcat shpinfo shpcat shpcentrd shpdxf shpfix shpproj
}
