# Contributor: Asuka Minato
pkgname=typst-book-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="A simple tool for creating modern online books in pure typst"
arch=(
	'aarch64'
	'armv7h'
	'x86_64'
)
url="https://myriad-dreamin.github.io/typst-book/"
_ghurl="https://github.com/Myriad-Dreamin/shiroa"
license=('Apache-2.0')
depends=(
	'glibc'
	'gcc-libs'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-aarch64-unknown-linux-gnu.tar.gz")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-arm-unknown-linux-gnueabihf.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('cac044949e877760f5d1eb70ba9418fafaafad0eb61620eb499f35a20f8211cf')
sha256sums_armv7h=('ad719234eb10d358c60b750d53b6c40b1e0235dfc3d89fa7ed2b818c8a098a3a')
sha256sums_x86_64=('8f97bcdef7bf720f7002d41672df02cd4242892fdd6a3125dd6d3019f15a6174')
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}-"*/bin/"${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/${pkgname%-bin}-"*/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}