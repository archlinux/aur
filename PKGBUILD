# Maintainer: YoyPa <yoann dot p dot public at gmail dot com>
pkgname=isw
pkgver=1.4
pkgrel=1
pkgdesc="Fan control tool for MSI gaming series laptops"
arch=('any')
url="https://github.com/YoyPa/isw"
license=('GPL')
depends=(
	'python'
	'coreutils'
)
backup=(
	'etc/isw.conf'
)
source=("isw-${pkgver}.tar.gz::https://github.com/YoyPa/isw/archive/${pkgver}.tar.gz")
sha256sums=('41ab7eefec4d9d655ca0873158bdfda39487487cfcbbfed9989d5a0db02cab87')

package() {
	cd "isw-${pkgver}"
	install -Dm 644 etc/isw.conf "${pkgdir}/etc/isw.conf"
	install -Dm 644 etc/modprobe.d/isw-ec_sys.conf "${pkgdir}/etc/modprobe.d/isw-ec_sys.conf"
	install -Dm 644 etc/modules-load.d/isw-ec_sys.conf "${pkgdir}/etc/modules-load.d/isw-ec_sys.conf"
	install -Dm 644 usr/lib/systemd/system/isw@.service "${pkgdir}/usr/lib/systemd/system/isw@.service"
	install -Dm 755 isw "${pkgdir}/usr/bin/isw"
}
