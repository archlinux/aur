# Maintainer: archlinuxauruser <archlinuxauruser at messagebox dot email>
# Contributor: aulonsal <seraur at aulonsal dot com>
pkgname=f2-bin
pkgver=2.2.0
pkgrel=1
pkgdesc='Cross-platform command-line tool for batch renaming files and directories quickly and safely'
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/ayoisaiah/${pkgname%-bin}"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}-LICENCE::${url/github/raw.githubusercontent}/v${pkgver}/LICENCE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
source_i686=("${pkgname}-${pkgver}-i686.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_386.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")

b2sums=('1375f8eb689085b7735551ce0f5f19167df905bdf8f105ac72479ae6214666f74a03ce24766bc08a9407c878ecd8078ca3e81013ecf4fd8c80a52dc308e29d78')
b2sums_x86_64=('e60f8de2b02b8dc2ce96c4c76703a1cbe3ab6988d617ee531014288b148814e4c79d8b9b71a5fd017cb0201e1479a8007e681b48202c07a26cf2e083226362d4')
b2sums_i686=('f19ec35b4c20d7edcd2f995d4d39e3dbb4c474421234b33cbfd21a189765927c5ec88442eaf014a8d9daddb023ca89568a8b0aa0a16b4f05f9229227ad786ce6')
b2sums_aarch64=('7ea5ab79471a67a09268d4967e20745c896ee79440232137ed8799a917d356cf40e4fccfdb8417c718d87d02be9ced79b362507da4bdff4f642b27d58e9a1c38')

package() {
	install -Dm755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${pkgname}-${pkgver}-LICENCE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
	install -Dm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}
