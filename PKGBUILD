# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname='warp-plus-go-bin'
pkgver=1.0.4_rc2
pkgrel=1
pkgdesc="An open-source implementation of Cloudflare's Warp, enhanced with Psiphon integration."
arch=('x86_64')
url="https://github.com/bepass-org/wireguard-go"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
install=
source=("${pkgname}-${pkgver//_/-}.zip::${url}/releases/download/v${pkgver//_/-}/warp-linux-amd64.b6d64e.zip"
				"${pkgname%-bin}.service")
sha256sums=('ae4de0e0928be13abc50a02a1e8edec40202daf59604f2ee59729a2fd2f54c82'
            '8ab87a001c368159f6e8aea1bb49571db04a6114374b794bb0155b437a72bead')

package() {
	install -Dm755 warp "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -D -t "${pkgdir}/usr/lib/systemd/system/" -m 644 "${pkgname%-bin}.service"
	install -d "${pkgdir}/etc/${pkgname%-bin}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
# vim:set ts=4 sw=4 et:
