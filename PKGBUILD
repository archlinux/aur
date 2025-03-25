# Maintainer: Firegem <firinggems@hotmail.com>
pkgname=nph-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="An opinionated code formatter for Nim"
arch=('x86_64')
url="https://github.com/arnetheduck/nph"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}"{,-git})
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/nph-linux_x64.tar.gz"
		"LICENSE.txt::https://raw.githubusercontent.com/arnetheduck/nph/refs/tags/v${pkgver}/copying.txt")
sha256sums=('d05ab53e70929a55901cb58e7a6170e0d5e36d3c2c826694a296423fee7c727c'
            '8d471f0034ba3efee1cdb0cfb8f3c6450dc221769132d1fc0ddaadd250374851')

package() {
	install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm755 "${srcdir}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
