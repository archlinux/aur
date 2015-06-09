# Maintainer: Olaf Bauer <hydro@freenet.de>

pkgname=dtv-scan-tables-git
pkgver=r1183.f2053b3
pkgrel=1
pkgdesc="Initial DVB scan tables, formerly part of the linuxtv-dvb-apps package"
arch=('any')
url="http://linuxtv.org/"
license=('GPL2')
makedepends=('git')
conflicts=('dtv-scan-tables')
provides=('dtv-scan-tables')
source=('git://linuxtv.org/dtv-scan-tables.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/dtv-scan-tables"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/dtv-scan-tables"
  install -d "$pkgdir/usr/share/dvb/atsc"
  install -d "$pkgdir/usr/share/dvb/dvb-c"
  install -d "$pkgdir/usr/share/dvb/dvb-s"
  install -d "$pkgdir/usr/share/dvb/dvb-t"
  install -m 664 atsc/* "$pkgdir/usr/share/dvb/atsc/"
  install -m 664 dvb-c/* "$pkgdir/usr/share/dvb/dvb-c/"
  install -m 664 dvb-s/* "$pkgdir/usr/share/dvb/dvb-s/"
  install -m 664 dvb-t/* "$pkgdir/usr/share/dvb/dvb-t/"
}
