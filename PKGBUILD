# Maintainer: Markus Härer <markus.haerer@gmx.net>
# Contributor: Markus Härer <markus.haerer@gmx.net>

pkgname=dvb-fe-tda10046-fw
pkgver=0.1
pkgrel=8
license=('custom')
pkgdesc="Firmware dvb-fe-tda10046.fw for Philips TDA10046H DVB-T"
arch=(any)
depends=()
makedepends=('perl' 'unzip')
source=('https://raw.githubusercontent.com/torvalds/linux/master/scripts/get_dvb_firmware')
url="http://www.kernel.org/"
md5sums=('SKIP')

build() {
  cd $srcdir/ || return 1
  perl get_dvb_firmware tda10046 || return 1
}

package() {
  cd $srcdir/ || return 1
  install -D -m 644 dvb-fe-tda10046.fw "$pkgdir/usr/lib/firmware/dvb-fe-tda10046.fw" || return 1
}
