# Maintainer:  Louis Tim Larsen <louis(a)louis.dk>, Alex Mekkering <amekkering at gmail dot com>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=libhdhomerun
pkgver=20200521
pkgrel=1
pkgdesc="Library and command line utility for interfacing with HDHomeRun device"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://www.silicondust.com/downloads"
license=('LGPL')
optdepends=('hdhomerun-firmware-bin: firmware for hdhomerun devices'
            'hdhomerun_config_gui: hdhomerun configuration gui')

source=("http://download.silicondust.com/hdhomerun/${pkgname}_${pkgver}.tgz")
sha512sums=('ac253923b531a8e1f714b7fb98da5a2a062144c045117a63e5bb16b33a49ccafcffd24f5520d412d15ca55bc1810fc0ecb9ad05e2d7f5a196b5439b4e28d5c23')

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
