pkgname=flightgear-data
pkgver=2024.1.1
_pkgver=v2024.1.1
pkgrel=2
pkgdesc="Base-Data for the opensource flight-simulator."
arch=('any')
depends=('perl' 'bash' 'python')
license=('GPL-2.0-or-later')
url="http://www.flightgear.org/"
options=(!strip !debug)
source=("https://gitlab.com/flightgear/fgdata/-/archive/${_pkgver}/fgdata-${_pkgver}.tar.gz")
md5sums=('14580ae9f41c19e5233108127cb3f3d8')

prepare() {
  mv $srcdir/fgdata-${_pkgver} $srcdir/fgdata
}

package() {
  mkdir -p $pkgdir/usr/share/flightgear
  mv $srcdir/fgdata $pkgdir/usr/share/flightgear/data
  chmod -R 755 $pkgdir/usr/share/flightgear/data/*
}
