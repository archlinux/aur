# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname='warp-plus-bin'
pkgver=1.1.0
pkgrel=1
_buildver=cdb551
pkgdesc="An open-source implementation of Cloudflare's Warp, enhanced with Psiphon integration."
arch=('x86_64')
url="https://github.com/bepass-org/warp-plus"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
install="${pkgname%-bin}.install"
source=("${pkgname%-bin}-${pkgver//_/-}-${_buildver}.zip::${url}/releases/download/v${pkgver//_/-}/warp-plus-linux-amd64.${_buildver}.zip"
		"${pkgname%-bin}-config.json"
		"${pkgname%-bin}.service")
sha256sums=('1f0ac7c201c3a23eb8c343cd4bd77f7e6023b0a818b87aca9b9e2760a14fb810'
            'b76bf2c04e60befcf95cf8ed38bfe3b56da7719cededb97f4048136789abe5fd'
            '5ada20e3b2871c0921dfe36d721914fa02fe2f4892919160daa71992e91be49b')

package() {
	install -D -t "${pkgdir}/usr/bin/" -m 755 "${pkgname%-bin}"
	install -D -t "${pkgdir}/usr/lib/systemd/system/" -m 644 "${pkgname%-bin}.service"
	install -Dm 644 "${pkgname%-bin}-config.json" "${pkgdir}/etc/${pkgname%-bin}/config.json"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
# vim:set ts=4 sw=4 et:
