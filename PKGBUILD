# Maintainer: archlinuxauruser <archlinuxauruser at messagebox dot email>
# Contributor: aulonsal <seraur at aulonsal dot com>
pkgname=f2-bin
pkgver=2.0.1
pkgrel=1
pkgdesc='Cross-platform command-line tool for batch renaming files and directories quickly and safely'
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/ayoisaiah/${pkgname%-bin}"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$pkgname-$pkgver-LICENCE::${url/github/raw.githubusercontent}/v${pkgver}/LICENCE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
source_i686=("${pkgname}-${pkgver}-i686.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_386.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")

b2sums=('1375f8eb689085b7735551ce0f5f19167df905bdf8f105ac72479ae6214666f74a03ce24766bc08a9407c878ecd8078ca3e81013ecf4fd8c80a52dc308e29d78')
b2sums_x86_64=('33d6606a52a1b6221b4f34558185e36fe7dbf4b04d79ff20d330f8cbd2fdacff89c9a9ca6185f913b04c741be27e9fbb91b488f0cd738c30fcb460d3ff232d7a')
b2sums_i686=('1f82fa320fba436a127c767001f5b0be882aafa5975abe354e403bf41aff1f7b8a735a3245b67373a34ea5d378a481f6ff507945ea4650e5487a583bb75918dc')
b2sums_aarch64=('fd2c1224b9e731246b5105b4e11a392e706bec451dd8bd2caa86e06bd178bcf41e015e83416db4e21deb1e631f617f774ee1bf98fda4a4949ab066a1cc43368c')

package() {
	install -Dm755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${pkgname}-${pkgver}-LICENCE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
	install -Dm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}
