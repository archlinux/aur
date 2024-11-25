# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Lena Fuhrimann
pkgname=moq-bin
pkgver=0.5.1
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
sha256sums_aarch64=('b17e95b5af5f288aa58268e90dc11be0b3efa432040f40bad575e1fb03c19056')
sha256sums_x86_64=('436913828149f2bdd82d32fd7d1b35e58c885b6919f91b60bb042432401e83e5')
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
