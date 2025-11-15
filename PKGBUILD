# Maintainer: archlinuxauruser <archlinuxauruser at messagebox dot email>
# Contributor: aulonsal <seraur at aulonsal dot com>
pkgname=f2-bin
pkgver=2.2.2
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
b2sums_x86_64=('907b889c20428d7b8563c221d06c5f1e0ae3100f94eb52770db294991033989bafe0cda385832d0e6e5d9f810b61aaead71b9791253689801a32c94d7b9f8761')
b2sums_i686=('be5cb7571869d4cee90cbb7ca53f3a6b0facfae1e610372b6ad72e3d95c77d20f4798aea191aae4289f48e32bbe44b5fde7145c995c2d790697a7eefdf242247')
b2sums_aarch64=('31dcdb43d8789162de11f49e9a25516f500e6fa5e39bc291395fd129040f0a29f64325bd928fd2cd94923e8cb0b3601849a839878490b3898a131d0b68b4a7c9')

package() {
	install -Dm755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 -T "${pkgname}-${pkgver}-LICENCE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
	install -Dm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}
