# Maintainer: Jeff Fredrickson <jeff.fredrickson@gmail.com>
# Maintainer: Misaka 19465 <19465@misakanet.team>
pkgname='disable-c6-systemd-with-modern-standby'
pkgdesc='A systemd service to disable the C6 state for Ryzen CPUs, with modern standby support.'
pkgver=1.0.1
pkgrel=2
provides=('disable-c6-systemd')
conflicts=('disable-c6-systemd')
arch=('any')
license=('MIT')
url='https://github.com/jfredrickson/disable-c6'
depends=('zenstates-git')
source=('disable-c6.service'
	'enable-c6.service')
md5sums=('d75b5b334bf8acb0e710874f918b5df6'
	'846e708cc70093a9fa5e307e6c65e1fd')
install=${pkgname}.install

package() {
	install -Dm644 "${srcdir}/disable-c6.service" "${pkgdir}/usr/lib/systemd/system/disable-c6.service"
	install -Dm644 "${srcdir}/enable-c6.service" "${pkgdir}/usr/lib/systemd/system/enable-c6.service"
}
