# Maintainer:  Alex Mekkering <amekkering at gmail dot com>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=libhdhomerun
pkgver=20180817
pkgrel=1
pkgdesc="Library and command line utility for interfacing with HDHomeRun device"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://www.silicondust.com/downloads"
license=('LGPL')
optdepends=('hdhomerun-firmware-bin: firmware for hdhomerun devices'
            'hdhomerun_config_gui: hdhomerun configuration gui')

source=("http://download.silicondust.com/hdhomerun/${pkgname}_${pkgver}.tgz")
sha256sums=('437888b27206f526827ee7a4c57c1c167a36483b0445232e07fb7bb7ee854b42')

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
