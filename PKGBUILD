# Maintainer: crasm <crasm@aur.1.email.vczf.io>
pkgname="openvpn-reconnect"
pkgver="1"
pkgrel="1"
pkgdesc="A simple script for reconnecting openvpn."
arch=("any")
url="https://github.com/crasm/openvpn-reconnect"
license=("ISC")
depends=("sh")
provides=("openvpn-reconnect")
source=("https://github.com/crasm/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('a51977e382d2f7e56103a0c7328eaa0c')

package() {
	cd "${pkgname}-${pkgver}"
	install -m 644 -D "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -m 755 -D "${pkgname}" \
		"${pkgdir}/usr/bin/${pkgname}"
	install -m 755 -D "${pkgname}-systemd.sh" \
		"${pkgdir}/usr/lib/systemd/system-sleep/${pkgname}-systemd.sh"
}
