# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Asuka Minato <asukaminato at nyan dot eu dot org>
pkgname=vtm-bin
pkgver=2026.09.28
pkgrel=1
pkgdesc="A text-based desktop environment that runs console applications in floating windows and allows remote access over tunnelling protocols such as SSH."
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
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.7z::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_arm64.tar.7z")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.7z::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_arm32.tar.7z")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.7z::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_x86.tar.7z")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.7z::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_x86_64.tar.7z")
sha256sums=('b7d69c3a45e98eb80ff9cd48d00334d72002d9d0f96b523f8feb33263af22e12')
sha256sums_aarch64=('874cc824f3d5070e97b2e61252b4df7938306a759cc7945f12c959e3fcc52693')
sha256sums_armv7h=('00867c24fe7779b75d66cca0ce28bdc74486e1fff1afda8a4d9da111ad936e2f')
sha256sums_i686=('57ab05ce5fefb6fb91f3f3615238465686d0dc91e6445136049141ab2a835f06')
sha256sums_x86_64=('ecb6f86edd8a0fb5ff98d4a4ae0ab5ec0ff95cedf13985c576c1e44bde62d40e')
prepare() {
	bsdtar -xf "${srcdir}/${pkgname%-bin}"*.tar
}
package() {
	#install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.xml" "${pkgdir}/etc/${pkgname%-bin}/settings.xml"
	install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
