# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname='warp-plus-bin'
pkgver=1.2.4
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
sha256sums=('305777eabf28c1456baf5bdf74ba6f941ce99bc1069388b3806ac4272cf3f875'
            '5ada20e3b2871c0921dfe36d721914fa02fe2f4892919160daa71992e91be49b')
sha256sums_x86_64=('5e7cde76392dbddcebc9fdef5d9b6c45f36c22580a8920acd06731acd7941ebb')
sha256sums_armv7h=('eaf29f35e0018449f5b5b00ecb1a9e8307e951ea2395502462b2be183605050b')
sha256sums_aarch64=('816ed17ca13b526a2927e0961a1064aa20301a1b015215b0c16fe27337b93a80')

package() {
	install -D -t "${pkgdir}/usr/bin/" -m 755 "${pkgname%-bin}"
	install -D -t "${pkgdir}/usr/lib/systemd/system/" -m 644 "${pkgname%-bin}.service"
	install -Dm 644 "${pkgname%-bin}-config.json" "${pkgdir}/etc/${pkgname%-bin}/config.json"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
# vim:set ts=4 sw=4 et:
