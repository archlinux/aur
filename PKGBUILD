# Maintainer: zoorat <zoorat [at] protonmail [dot] com>
# Old Maintainer: Firegem <mrfiregem [at] protonmail [dot] ch>

pkgname=dasel-bin
_pkgname=${pkgname%-bin}
pkgver=3.3.1
pkgrel=1

pkgdesc="Query and update data structures from the command line."
arch=('x86_64')
url="https://github.com/TomWright/dasel"
license=('MIT')

changelog="changelog.md"

source=(
	"${pkgname}-v${pkgver}.gz::${url}/releases/download/v${pkgver}/dasel_linux_amd64.gz"
	"https://raw.githubusercontent.com/TomWright/dasel/master/LICENSE"
	"https://raw.githubusercontent.com/TomWright/dasel/master/CHANGELOG.md"
	"https://raw.githubusercontent.com/TomWright/dasel/master/README.md"
)

b2sums=('80e0995cce67d7bd32fdd472a232563c12341f27d638df55ae8b991cc58a1ca93e3edeb1555a69d020da2518092b703ea307b4e84598773903f56b2f4c222cc7'
	'fc06e1db2cd7753e9188087833b4fad2bdcb78165bef8dd26bab3760c6a76287e8a582e6dcfd61f09f2051e4bcff71361ffd28d0024445ac5243075a86daed69'
	'61249c5b2df496f644848c1d3a99024288885c1617946d8828ff5e89563e7ea86443027565fdf20585ea05dc827c2bc25eaed804efbd8fc0101eab97b45661aa'
	'80943a2792c184e83bf2ac994a44fb7aaef961c5268691997f47ead4d2420bc6451b9203b684fcd706999c641801e91a7380ead0f1383e42897fe1a18d165a24')

package() {
	cd "$srcdir"
	install -Dm755 "${pkgname}-v${pkgver}" "${pkgdir}/usr/bin/dasel"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
	install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
}
