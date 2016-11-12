# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=libhdhomerun
pkgver=20161107
pkgrel=1
pkgdesc="Library and command line utility for interfacing with HDHomeRun device"
arch=('any')
url="http://www.silicondust.com/downloads"
license=('LGPL')
source=("http://download.silicondust.com/hdhomerun/${pkgname}_${pkgver}.tgz")
md5sums=('9835301755c12a2596e12360f5b5a507')
depends=('glibc')
optdepends=('hdhomerun-firmware-bin: firmware for hdhomerun devices'
'hdhomerun_config_gui: hdhomerun configuration gui')

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"

  install -D -m 644 *.h -t $pkgdir/usr/include/libhdhomerun/
  install -D -m 755 libhdhomerun.so $pkgdir/usr/lib/libhdhomerun.so
  install -D -m 755 hdhomerun_config $pkgdir/usr/bin/hdhomerun_config
}
