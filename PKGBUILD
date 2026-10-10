# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Asuka Minato <asukaminato at nyan dot eu dot org>
pkgname=vtm-bin
pkgver=2026.10.05
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
sha256sums_aarch64=('46231af12f04f600952b24e1265d9c1340ed14d2eed046bb175d530b9427a9b5')
sha256sums_armv7h=('3eaf25876e55fdc890f2d3acd21ae0258e6135d489e0d74fa7f306b58065253e')
sha256sums_i686=('c3d8a21d6f1f45a43b13a5dabb96d52637fb893c1bdb40cfd4cfc1ebd84f0793')
sha256sums_x86_64=('cb78c263d22803f36f9ace7778b31e8b758aad18a1ad08a7759052c190ebf647')
prepare() {
	bsdtar -xf "${srcdir}/${pkgname%-bin}"*.tar
}
package() {
	#install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.xml" "${pkgdir}/etc/${pkgname%-bin}/settings.xml"
	install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
