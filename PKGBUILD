# Maintainer:  Alex Mekkering <amekkering at gmail dot com>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=libhdhomerun
pkgver=20170930
pkgrel=1
pkgdesc="Library and command line utility for interfacing with HDHomeRun device"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://www.silicondust.com/downloads"
license=('LGPL')
optdepends=('hdhomerun-firmware-bin: firmware for hdhomerun devices'
            'hdhomerun_config_gui: hdhomerun configuration gui')

source=("http://download.silicondust.com/hdhomerun/${pkgname}_${pkgver}.tgz")
sha256sums=('0cb392231961fab6c226c69012503e2ebe46ac0f13512689bd37d6cf9ee838a1')

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
