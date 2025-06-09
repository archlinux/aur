# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname='warp-plus-bin'
pkgver=1.2.6
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
sha256sums=('a058195ddeca8f37345f5110acaa023ed099b48414f65d579d11937ff62a0bdb'
            '5ada20e3b2871c0921dfe36d721914fa02fe2f4892919160daa71992e91be49b')
sha256sums_x86_64=('380d2c8655b33db818adf407c706d52d14c2ab1764e702e91f356a7d7d9c3c98')
sha256sums_armv7h=('1bf345f81923d421de49ec549256c3cadac93313f3292a850392ae9b10169098')
sha256sums_aarch64=('c0b430c117eaa33513fa012aca983303ee88a4bda0f935dc62ff016109e492f3')

package() {
	install -D -t "${pkgdir}/usr/bin/" -m 755 "${pkgname%-bin}"
	install -D -t "${pkgdir}/usr/lib/systemd/system/" -m 644 "${pkgname%-bin}.service"
	install -Dm 644 "${pkgname%-bin}-config.json" "${pkgdir}/etc/${pkgname%-bin}/config.json"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
# vim:set ts=4 sw=4 et:
