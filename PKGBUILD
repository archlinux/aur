# Maintainer: zoorat <zoorat [at] protonmail [dot] com>
# Old Maintainer: Firegem <mrfiregem [at] protonmail [dot] ch>

pkgname=dasel-bin
_pkgname=${pkgname%-bin}
pkgver=3.3.2
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

b2sums=('0ad464eef1bbaf8243f759fef687df46898bfe169e817d93b6ec60335926f10ff5757ce2ef91af399b63424f2ce3c0f8fbe25aed5b3181d1338964b7d7a021af'
	'fc06e1db2cd7753e9188087833b4fad2bdcb78165bef8dd26bab3760c6a76287e8a582e6dcfd61f09f2051e4bcff71361ffd28d0024445ac5243075a86daed69'
	'49cbdd198944199a9f497ffe5b5fc1d67e9d4db2ce6d8dbfa61a3734694f73e9c60fdb75a9494fe618823e4df1d8489874e897548fe94d4eb6dca580a78512c8'
	'80943a2792c184e83bf2ac994a44fb7aaef961c5268691997f47ead4d2420bc6451b9203b684fcd706999c641801e91a7380ead0f1383e42897fe1a18d165a24')

package() {
	cd "$srcdir"
	install -Dm755 "${pkgname}-v${pkgver}" "${pkgdir}/usr/bin/dasel"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
	install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
}
