# Maintainer:  Louis Tim Larsen <louis(a)louis.dk>, Alex Mekkering <amekkering at gmail dot com>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=libhdhomerun
pkgver=20260313
pkgrel=1
pkgdesc="Library and command line utility for interfacing with HDHomeRun device"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://www.silicondust.com/support/downloads"
license=(LGPL-2.1-or-later)
depends=(glibc)
optdepends=('hdhomerun-firmware-bin: firmware for hdhomerun devices'
            'hdhomerun_config_gui: hdhomerun configuration gui')

source=("https://download.silicondust.com/hdhomerun/${pkgname}_${pkgver}.tgz")
b2sums=('0337b96868d9f1a02e8a265fbdabae7ea86240dbfe17d1795d4e53cf33880e4991b22afb24c3e0edc299d177e2288eba042970daad70977bd54faa5db9a83ee4')

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
