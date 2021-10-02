# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=steinberg-asio-sdk
pkgver=2.3.3
pkgrel=3
pkgdesc="Steinberg's ASIO SDK"
url="https://www.steinberg.net/en/company/developers.html"
arch=('any')
license=('custom')
conflicts=('steinberg-asio')
provides=('steinberg-asio')
_release="asiosdk_2.3.3_2019-06-14"
source=("https://download.steinberg.net/sdk_downloads/${_release}.zip")
sha256sums=('1e044e26c3ce275ee08007d524e97ef5ab36e3aa5efbcb1e44844542d7c13ab2')

package() {
	cd "${srcdir}/${_release}"

	install -d -m755 -p "${pkgdir}/usr/share/licenses/${pkgname}"
	install -D -m644 Steinberg*Licensing*Agreement*.pdf "${pkgdir}/usr/share/licenses/${pkgname}"
	install -D -m644 common/asio.h "${pkgdir}/usr/include/${pkgname%%-sdk}/asio.h"
}
