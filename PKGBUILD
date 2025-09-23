# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Asuka Minato <asukaminato at nyan dot eu dot org>
pkgname=vtm-bin
pkgver=2025.09.23
pkgrel=1
pkgdesc="A text-based desktop environment that runs console applications in floating windows and allows remote access over tunnelling protocols such as SSH.(Prebuilt version)"
arch=(
	'aarch64'
	'armv7h'
	'i686'
	'x86_64'
)
url="https://github.com/directvt/vtm"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=(
	#"${pkgname%-bin}-${pkgver}.xml::https://raw.githubusercontent.com/directvt/vtm/v${pkgver}/src/vtm.xml"
	"LICENSE-${pkgver}::https://raw.githubusercontent.com/directvt/vtm/v${pkgver}/LICENSE"
)
backup=("etc/${pkgname%-bin}/settings.xml")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_arm64.zip")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_arm32.zip")
source_i686=("${pkgname%-bin}-${pkgver}-i686.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_x86.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_x86_64.zip")
sha256sums=('b7d69c3a45e98eb80ff9cd48d00334d72002d9d0f96b523f8feb33263af22e12')
sha256sums_aarch64=('58f351509fd2b69b1e7c3b3350aade9c498ecbaf691487301fa858f438aacc9b')
sha256sums_armv7h=('a9cc17202bba22854a6b38c8be5aecf2a47cff8a5ee417a0ff20ff60bf7107ee')
sha256sums_i686=('4392e6f45b753499601d043e323f4b259ad80ee630f6d534276c3260f0a0e357')
sha256sums_x86_64=('8d8d8636c1582d9d943de3b058d3be28643b300ed6330e4a615297a5be5f12a1')
prepare() {
	bsdtar -xf "${srcdir}/${pkgname%-bin}"*.tar
}
package() {
	#install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.xml" "${pkgdir}/etc/${pkgname%-bin}/settings.xml"
	install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
