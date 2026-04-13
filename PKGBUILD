# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Asuka Minato <asukaminato at nyan dot eu dot org>
pkgname=vtm-bin
pkgver=2026.04.11
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
sha256sums_aarch64=('355427f2a000c668c786f41d5e2d9495da51f40d1563eadcda5058f92fc4ccff')
sha256sums_armv7h=('6191929cd7a182ffe6bab91099bc0c88daf6159cf46c3e4db93f7f87d4369928')
sha256sums_i686=('a783b38c75a44a2c044da37f0a2be1566728bef42b0f519297ad370b0c6b231b')
sha256sums_x86_64=('0b4d894fc1cc7cd4e25bfab781ce9d4d68e97511683abffd1fbf610ea50d7907')
prepare() {
	bsdtar -xf "${srcdir}/${pkgname%-bin}"*.tar
}
package() {
	#install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.xml" "${pkgdir}/etc/${pkgname%-bin}/settings.xml"
	install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
