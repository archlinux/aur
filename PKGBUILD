# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Lena Fuhrimann
pkgname=moq-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Interface mocking tool for go generate."
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
sha256sums_aarch64=('b72498786f4bdd2c43813093fc35f8cac53e32f3590796e45a2cd4023b482dab')
sha256sums_x86_64=('794af715da3b5bfabc7d354df81748fe33854e1ff5b38de9f5398d133a425b06')
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
