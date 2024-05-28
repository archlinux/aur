# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname='warp-plus-bin'
pkgver=1.2.2
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
sha256sums=('f2e9211840f56060f876a43dfe9763928f867ee45d795d3cedb67bf654fb8844'
            '305777eabf28c1456baf5bdf74ba6f941ce99bc1069388b3806ac4272cf3f875'
            '5ada20e3b2871c0921dfe36d721914fa02fe2f4892919160daa71992e91be49b')

package() {
	install -D -t "${pkgdir}/usr/bin/" -m 755 "${pkgname%-bin}"
	install -D -t "${pkgdir}/usr/lib/systemd/system/" -m 644 "${pkgname%-bin}.service"
	install -Dm 644 "${pkgname%-bin}-config.json" "${pkgdir}/etc/${pkgname%-bin}/config.json"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
# vim:set ts=4 sw=4 et:
