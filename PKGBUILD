# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: IIpho3nix <iipho3nix at gmail dot com>
pkgname=goshs-bin
pkgver=2.1.8
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
sha256sums_aarch64=('0d713a0415f8f16c411505f36e1816d05e0ea686665cc64fa1d0676e7dd9df68')
sha256sums_armv7h=('ee710cead5e45b6086233b6924aa85087e25c2bb1bbee47a36b8eef565f5ae35')
sha256sums_i686=('80df45e1086e5d87d3dff10f45bae32e6f0b53985c7a5ed4ecf7584032a4e839')
sha256sums_x86_64=('11d4a1bc8054c0296e5c7af263d3b440f66ed77ab682733c029fd2cbe4664292')
package() {
	install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}