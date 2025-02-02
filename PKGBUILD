# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname='warp-plus-bin'
pkgver=1.2.5
pkgrel=1
pkgdesc="An open-source implementation of Cloudflare's Warp, enhanced with Psiphon integration."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/bepass-org/warp-plus"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
backup=('etc/warp-plus/config.json')
install="${pkgname%-bin}.install"
source_x86_64=("${pkgname%-bin}-${pkgver//_/-}-amd64.zip::${url}/releases/download/v${pkgver//_/-}/warp-plus_linux-amd64.zip")
source_aarch64=("${pkgname%-bin}-${pkgver//_/-}-arm64.zip::${url}/releases/download/v${pkgver//_/-}/warp-plus_linux-arm64.zip")
source_armv7h=("${pkgname%-bin}-${pkgver//_/-}-arm7.zip::${url}/releases/download/v${pkgver//_/-}/warp-plus_linux-arm7.zip")
source=("${pkgname%-bin}-config.json"
		"${pkgname%-bin}.service")
sha256sums=('0222b18938f39a29f23a04fd0617e7ee155745ce8f1dd2f21afbc50311afd6a8'
            '5ada20e3b2871c0921dfe36d721914fa02fe2f4892919160daa71992e91be49b')
sha256sums_x86_64=('979fcfd262b71041a872d3172d643fe0ad3b2b91409febb60fd9e7227ad18100')
sha256sums_armv7h=('329fe08ae9faf758bf4e4ed82058b78f64c46ed2dbb5fbfbfa52b16487899491')
sha256sums_aarch64=('6c5e9385838c694c091a63dd6697dccfbc9e3c1abd34c5aa74ff1bfed4310454')

package() {
	install -D -t "${pkgdir}/usr/bin/" -m 755 "${pkgname%-bin}"
	install -D -t "${pkgdir}/usr/lib/systemd/system/" -m 644 "${pkgname%-bin}.service"
	install -Dm 644 "${pkgname%-bin}-config.json" "${pkgdir}/etc/${pkgname%-bin}/config.json"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
# vim:set ts=4 sw=4 et:
