# Maintainer: Daniel Martí <mvdan@mvdan.cc>

pkgname=shfmt-bin
_pkg=sh
_name=shfmt
pkgver=2.5.0
pkgrel=1
pkgdesc="Format shell programs (pre-compiled static binary)"
url="https://github.com/mvdan/${_pkg}"
license=('BSD')
provides=('shfmt')
conflicts=('shfmt')

arch=('x86_64')
source_x86_64=(
	"https://github.com/mvdan/sh/releases/download/v${pkgver}/shfmt_v${pkgver}_linux_amd64"
	"https://raw.githubusercontent.com/mvdan/sh/v${pkgver}/LICENSE"
)
sha256sums_x86_64=(
	'fce24cfa408362e6802f1cec9b2b9f92fb865eb8ae1233ee2874b5d0c66b2f91'
	'SKIP'
)

package() {
	install -Dm755 shfmt_v${pkgver}_linux_amd64 "${pkgdir}/usr/bin/${_name}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
