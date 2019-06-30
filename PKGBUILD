# Maintainer:  Alex Mekkering <amekkering at gmail dot com>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=libhdhomerun
pkgver=20190621
pkgrel=1
pkgdesc="Library and command line utility for interfacing with HDHomeRun device"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://www.silicondust.com/downloads"
license=('LGPL')
optdepends=('hdhomerun-firmware-bin: firmware for hdhomerun devices'
            'hdhomerun_config_gui: hdhomerun configuration gui')

source=("http://download.silicondust.com/hdhomerun/${pkgname}_${pkgver}.tgz")
sha256sums=('9a60f663b00de5f820bdb85806662e25f22da248b14942e33a8b43a0331f855a')

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
