# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=steinberg-asio-sdk
pkgver=2.3.2
pkgrel=1
pkgdesc="Steinberg's ASIO SDK"
url="https://www.steinberg.net/en/company/developers.html"
arch=('any')
license=('custom')
conflicts=('steinberg-asio')
provides=('steinberg-asio')
source=("http://www.steinberg.net/sdk_downloads/ASIOSDK${pkgver}.zip")
sha256sums=('f8380b96cd64929986857466ef530572fabf755ba16a0693a37e4331a02fb692')

package() {
	cd "${srcdir}/ASIOSDK${pkgver}"

	install -d -m755 -p "${pkgdir}/usr/share/licenses/${pkgname}"
	install -D -m644 "Steinberg ASIO Licensing Agreement.pdf" "${pkgdir}/usr/share/licenses/${pkgname}"
	install -D -m644 common/asio.h "${pkgdir}/usr/include/${pkgname%%-sdk}/asio.h"
}
