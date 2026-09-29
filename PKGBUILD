# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: IIpho3nix <iipho3nix at gmail dot com>
pkgname=goshs-bin
pkgver=2.1.7
pkgrel=1
pkgdesc="A SimpleHTTPServer written in Go, enhanced with features and with a nice design."
arch=(
	'aarch64'
	'armv7h'
	'i686'
	'x86_64'
)
url="https://goshs.de/"
_ghurl="https://github.com/goshs-labs/goshs"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/goshs-labs/goshs/v${pkgver}/LICENSE")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.rpm")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_armv7.rpm")
source_i686=("${pkgname%-bin}-${pkgver}-i686.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_386.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.rpm")
sha256sums=('791aa7d1cac7e097ad6e792e974688f433018e11bbe387e62330319dda68c94a')
sha256sums_aarch64=('08696313f05ef4cbc280087592044d0f8e29ac5a4f02d13b74e5085322a7837d')
sha256sums_armv7h=('86863c55ed078f840e501545954ee01dded2dbdc14612a4534163b09aef13816')
sha256sums_i686=('438954ad66dd10b742347b0aeed045057f549a1b04aad34da0b7eff52b6115d9')
sha256sums_x86_64=('932436d1dbe64fbe61cbbf47c049f0ee242c3909280954956f0162d8978c22ae')
package() {
	install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
