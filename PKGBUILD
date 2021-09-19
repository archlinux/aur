# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

pkgname=raspbee2-rtc
pkgver=20200609
_commit=6fabff2ee826c004dfb17eb4a5df115e262a0157
pkgrel=1
pkgdesc="RTC service file for RaspBee II"
arch=('any')
url="https://github.com/dresden-elektronik/raspbee2-rtc"
license=("BSD")
depends=("rtc-pcf85063")
makedepends=("git")
source=("git+https://github.com/dresden-elektronik/raspbee2-rtc.git#commit=$_commit")
sha256sums=('SKIP')

package() {
  cd $pkgname
  install -Dm644 rtc-pcf85063.service $pkgdir/usr/lib/systemd/system/rtc-pcf85063.service
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -d $pkgdir/usr/lib/modules-load.d/
  echo "rtc_pcf85063" > $pkgdir/usr/lib/modules-load.d/rtc_pcf85063.conf
}
