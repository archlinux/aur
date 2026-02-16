# Maintainer: zoorat <zoorat [at] protonmail [dot] com>
# Old Maintainer: Firegem <mrfiregem [at] protonmail [dot] ch>

pkgname=dasel-bin
_pkgname=${pkgname%-bin}
pkgver=3.2.2
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

b2sums=('97612b80f445e457bc77ce42cf6a1659e447990c1b70f29d42cd041db755a0b28ef08689978e9a111e0aa74c28ff1581283acb8b6a29c9d796ced6937297ff94'
	'fc06e1db2cd7753e9188087833b4fad2bdcb78165bef8dd26bab3760c6a76287e8a582e6dcfd61f09f2051e4bcff71361ffd28d0024445ac5243075a86daed69'
	'8f5422f05a97b6f41df6136ff4e7d46b3046a513fbc75ccbbf5f2dcdd0f39e73d0fc2153bce304a0f77c5259a3071779c090b2a221917996b0619a3f10216cb2'
	'80943a2792c184e83bf2ac994a44fb7aaef961c5268691997f47ead4d2420bc6451b9203b684fcd706999c641801e91a7380ead0f1383e42897fe1a18d165a24')

package() {
	cd "$srcdir"
	install -Dm755 "${pkgname}-v${pkgver}" "${pkgdir}/usr/bin/dasel"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
	install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
}
