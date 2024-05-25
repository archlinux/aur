# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname='warp-plus-bin'
pkgver=1.2.1
pkgrel=1
pkgdesc="An open-source implementation of Cloudflare's Warp, enhanced with Psiphon integration."
arch=('x86_64')
url="https://github.com/bepass-org/warp-plus"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
install="${pkgname%-bin}.install"
source=("${pkgname%-bin}-${pkgver//_/-}.zip::${url}/releases/download/v${pkgver//_/-}/warp-plus_linux-amd64.zip"
		"${pkgname%-bin}-config.json"
		"${pkgname%-bin}.service")
sha256sums=('cbef12cc5914a8e76ff802b8557aed336da352ba7633a2599339eb81ad4e1e15'
            '68f4ef7197a6b4ef07ccf1865787eace4609a36db9fc98e10736a260712ce77f'
            '5ada20e3b2871c0921dfe36d721914fa02fe2f4892919160daa71992e91be49b')

package() {
	install -D -t "${pkgdir}/usr/bin/" -m 755 "${pkgname%-bin}"
	install -D -t "${pkgdir}/usr/lib/systemd/system/" -m 644 "${pkgname%-bin}.service"
	install -Dm 644 "${pkgname%-bin}-config.json" "${pkgdir}/etc/${pkgname%-bin}/config.json"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
# vim:set ts=4 sw=4 et:
