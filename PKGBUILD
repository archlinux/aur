# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Asuka Minato <asukaminato at nyan dot eu dot org>
pkgname=vtm-bin
pkgver=2026.01.03
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
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.7z::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_arm64.tar.7z")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.7z::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_arm32.tar.7z")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.7z::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_x86.tar.7z")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.7z::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_x86_64.tar.7z")
sha256sums=('b7d69c3a45e98eb80ff9cd48d00334d72002d9d0f96b523f8feb33263af22e12')
sha256sums_aarch64=('ec05cd8f759bc8740f1e7b8d6be7df95c5a9d6746a666dc7e15112f59d033436')
sha256sums_armv7h=('14f7626af2534dd59080956dbf1f765a42f3e3455adc9f749f5aa4ab81b02362')
sha256sums_i686=('dd05d77597fea4943f53f429470b0b68396e2077ea5dbaf28b4355d5b3bfc582')
sha256sums_x86_64=('6293f33ee2cea5362305800a00fa7d65575a5c29719d459abbe698545e89797b')
prepare() {
	bsdtar -xf "${srcdir}/${pkgname%-bin}"*.tar
}
package() {
	#install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.xml" "${pkgdir}/etc/${pkgname%-bin}/settings.xml"
	install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
