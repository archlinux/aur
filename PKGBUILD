# Contributor: Asuka Minato
pkgname=typst-book-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="A simple tool for creating modern online books in pure typst"
arch=(
	'aarch64'
	'armv7h'
	'x86_64'
)
url="https://myriad-dreamin.github.io/typst-book/"
_ghurl="https://github.com/Myriad-Dreamin/typst-book"
license=('Apache-2.0')
depends=(
	'glibc'
	'gcc-libs'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-aarch64-unknown-linux-gnu.tar.gz")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-arm-unknown-linux-gnueabihf.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('334c06a6be0c0c0275b691bd662353ced153e92b01b20174bad958732a0d7fd6')
sha256sums_armv7h=('e0213b95ebd714d63d23b8d57dccdebfcab22dd7d64a116daa7395029882107e')
sha256sums_x86_64=('85896dec27f151f68954fe340e7e2f5d2a80430da92c682f81c77bea66b42af2')
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}-"*/bin/"${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/${pkgname%-bin}-"*/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}