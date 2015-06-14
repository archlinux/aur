# Maintainer: Zdeněk Janeček <jan.zdenek@gmail.com>

pkgname=dvb-fe-tda10048-1.0.fw
pkgver=1
pkgrel=2
license=('custom')
pkgdesc="Firmware dvb-fe-tda10048-1.0.fw for Philips TDA10048H DVB-T demodulator"
arch=(any)
depends=()
makedepends=()
source=('http://steventoth.net/linux/hvr1700/HVR-12x0-14x0-17x0_1_25_25271_WHQL.zip')
url="http://linuxtv.org/wiki/index.php/NXP_TDA10048#TDA10048"
md5sums=('7fe395c1a398f079d98e416ee7be3777')

build() {
  cd $srcdir/
  dd if=Driver85/hcw85bda.sys of=dvb-fe-tda10048-1.0.fw bs=1 skip=667744 count=24878
  install -D -m 644 "$pkgname" "$pkgdir/usr/lib/firmware/$pkgname" || return 1
}
