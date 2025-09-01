# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Lena Fuhrimann
pkgname=moq-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Interface mocking tool for go generate.(Prebuilt version)"
arch=(
	'aarch64'
	'x86_64'
)
url="http://bit.ly/meetmoq"
_ghurl="https://github.com/matryer/moq"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_Linux_arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_Linux_x86_64.tar.gz")
sha256sums_aarch64=('35e16fc9ab98e9871826dd5643c3d5b1440bcf3d8aed6cfd0a60e64885c67600')
sha256sums_x86_64=('0ed9a98e7798882cca615d475d27af4ccc4d22f1f8e6ebe8d8bd942a95ddb415')
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
