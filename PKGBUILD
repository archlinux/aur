# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Lena Fuhrimann
pkgname=moq-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Interface mocking tool for go generate"
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
sha256sums_aarch64=('145a434af9de5cdfe56fb438fd63d9fbeafe8cdf2d3995668a5466dc0943cdd9')
sha256sums_x86_64=('6537aba94e667e03d755d2ccaf1677bd92d39af10783c7db68a32740a6676dfe')
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}