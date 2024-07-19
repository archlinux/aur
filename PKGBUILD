# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Asuka Minato <asukaminato at nyan dot eu dot org>
pkgname=vtm-bin
pkgver=0.9.93
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
	"LICENSE-${pkgver}::https://raw.githubusercontent.com/directvt/vtm/v${pkgver}/LICENSE"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_arm64.zip")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_arm32.zip")
source_i686=("${pkgname%-bin}-${pkgver}-i686.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_x86.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_x86_64.zip")
sha256sums=('7b7086edfedec1a2d8b40bc3748c2b77688806b4ab1081c3570fd7bb9b2c7842')
sha256sums_aarch64=('484f052ea732e037f5887187ab5ba250f30e7268ab9a08224e5142ce556663f3')
sha256sums_armv7h=('40b67135b011cf3bc253a5129dfcdc252befd2aba966946d2b0fb264f73dd944')
sha256sums_i686=('2728043346f88b3052ebc70e06efb272b68d19f2724efe9bfeab1b34fcd0bff1')
sha256sums_x86_64=('e28dffc0764bb91e5c3aba8d0ffa0cea49293fb5859fac57a2d3d03a417b33e1')
build() {
	bsdtar -xf "${srcdir}/${pkgname%-bin}"*.tar
}
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}