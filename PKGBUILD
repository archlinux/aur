# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Asuka Minato <asukaminato at nyan dot eu dot org>
pkgname=vtm-bin
pkgver=2026.07.21
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
sha256sums_aarch64=('7276f34164460198ebf2b9158352f3992df52974374c7cf67f749d06455bdb85')
sha256sums_armv7h=('975e7095a278c795acc0f2e207618d993479dafad089b0e9b49fc86c5b3f9a1e')
sha256sums_i686=('a90ae711f60ab9d9d6c7562c8e7e73adc0d4aea639ad0352c08f156cbb66bbf2')
sha256sums_x86_64=('4289064e95d07ff962e5ca8c042501a822e7bf57073365f9a06d5043a7702dfb')
prepare() {
	bsdtar -xf "${srcdir}/${pkgname%-bin}"*.tar
}
package() {
	#install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.xml" "${pkgdir}/etc/${pkgname%-bin}/settings.xml"
	install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
