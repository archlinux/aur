pkgname=flightgear-data
pkgver=2024.1.1
_pkgver=2024.1.1
pkgrel=1
pkgdesc="Base-Data for the opensource flight-simulator."
arch=('any')
license=('GPL')
url="http://www.flightgear.org/"
options=(!strip !debug)
source=("https://gitlab.com/flightgear/fgdata/-/archive/v${_pkgver}/fgdata-v${_pkgver}.tar.gz")
sha256sums=('39202a62d1236d51450232778751339bd29de650ea16a27c7ebbdccd6ea355b7')

package() {
  mv $srcdir/fgdata-v${_pkgver} $srcdir/data
  mkdir -p $pkgdir/usr/share/flightgear
  mv $srcdir/data $pkgdir/usr/share/flightgear/data
  chmod -R 755 $pkgdir/usr/share/flightgear/data/*
}
