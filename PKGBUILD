# Maintainer: Daniel Martí <mvdan@mvdan.cc>

pkgname=shfmt-bin
_pkg=sh
_name=shfmt
pkgver=2.6.0
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
	'e582c3417f1b773598c219683a98cc1ce444ca04aef1fa8457c378ad00316b29'
	'ce63850f77649f00d1394045e2794ffb09a5596beabac51c9548edd958845d7c'
)

package() {
	install -Dm755 shfmt_v${pkgver}_linux_amd64 "${pkgdir}/usr/bin/${_name}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
