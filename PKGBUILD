# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=libhdhomerun
pkgver=20150826
pkgrel=1
pkgdesc="Library and command line utility for interfacing with HDHomeRun device"
arch=('any')
url="http://www.silicondust.com/downloads"
license=('LGPL')
source=("http://download.silicondust.com/hdhomerun/${pkgname}_${pkgver}.tgz")
md5sums=('05f9a9e1fc8f6ec004b399034775cab0')
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
