# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Lena Fuhrimann
pkgname=moq-bin
pkgver=0.7.1
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
sha256sums_aarch64=('a437d2732e340042f89543a73c746302b4e44a9a6cf14a3d069361b01d7b0cc9')
sha256sums_x86_64=('98b79927474a82aac3e0d49bf2002987431f89ecd8157d2e4616808252b08154')
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
