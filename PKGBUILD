# Maintainer: Rajnish Mishra <contact.rajnishmishra@gmail.com>

pkgname=raspberrypi-rtc-ds1307
pkgver=0.1
pkgrel=1
pkgdesc="Raspberry Pi i2C RTC DS1307 clock boot load scripts"
url="http://github.com/darajnish/raspberrypi-i2c-rtc-ds1307"
arch=('armv6h' 'armv7h' 'aarch64')
license=('MIT')
makedepends=('git')
source=('rtc-ds1307-load.sh'
	'rtc-ds1307.service'
	'rtc-ds1307.conf'
	'LICENSE')
md5sums=('a8a465f320d9e0171b4859cc5316df44'
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
