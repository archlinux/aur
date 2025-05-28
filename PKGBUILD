# Maintainer: archlinuxauruser <archlinuxauruser at messagebox dot email>
# Contributor: aulonsal <seraur at aulonsal dot com>
pkgname=f2-bin
pkgver=2.1.2
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
b2sums_x86_64=('ebfcb1dd2ed7f6441f5fd8e5404657bac325108d164830b92ef5b4292169a21fd4cd40b75f2ca0997b3ba2fa30764a43d5c51a00f87cf303dcb4865dd2915192')
b2sums_i686=('a487393e90899209da1aa1d402e85cca9f42de421f5515d64efd698b2e7c50c053f44baf18ec74e716008c42a1cdf1cd78f55ff8262fa876a6191222d987009d')
b2sums_aarch64=('a1e7c8ae91ebd43fddc4743d090ee9aa924746a7646a0e843026fb517e9e3d70c4bb1a91c1d69240b6daa9bd1066f5358c68074a9b296aa0cdaf452b4dc014f3')

package() {
	install -Dm755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${pkgname}-${pkgver}-LICENCE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
	install -Dm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}
