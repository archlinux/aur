# Maintainer: Rajnish Mishra <contact.rajnishmishra@gmail.com>

pkgname=raspberrypi-rtc-ds1307
pkgver=0.1
pkgrel=2
pkgdesc="Raspberry Pi i2C RTC DS1307 clock boot load scripts"
url="http://github.com/darajnish/raspberrypi-i2c-rtc-ds1307"
arch=('armv6h' 'armv7h' 'aarch64')
license=('MIT')
depends=('i2c-tools')
makedepends=('git')
source=('rtc-ds1307-load.sh'
	'rtc-ds1307.service'
	'rtc-ds1307.conf'
	'LICENSE')
md5sums=('72f654b0127a4b5fa8128f8289eaf051'
	'c8bbf6826620d1b89faa47da2b52ab0f'
	'b6c1d9e9c47c21193874ec190e82db62'
	'2d327893436081b1eb7243ed5b9273d7')

package() {
	cd "${srcdir}"
	install -Dm755 rtc-ds1307-load.sh "${pkgdir}/usr/lib/systemd/scripts/rtc-ds1307-load"
	install -Dm644 rtc-ds1307.service "${pkgdir}/usr/lib/systemd/system/rtc-ds1307.service"
	install -Dm644 rtc-ds1307.conf "${pkgdir}/usr/lib/modules-load.d/rtc-ds1307.conf"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
