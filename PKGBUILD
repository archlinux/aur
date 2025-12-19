# Maintainer: zoorat <zoorat [at] protonmail [dot] com>
# Old Maintainer: Firegem <mrfiregem [at] protonmail [dot] ch>

pkgname=dasel-bin
_pkgname=${pkgname%-bin}
pkgver=3.1.4
pkgrel=2

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

b2sums=('a7fbdf11a0d4248b0825c9febe2e79c4c23883f8a43aeb2d9ff47c281e49e14aa34da4ab3fbae44c0ac358c6a6d6170130498c1821a82d7978a0c79fa7b5f235'
	'fc06e1db2cd7753e9188087833b4fad2bdcb78165bef8dd26bab3760c6a76287e8a582e6dcfd61f09f2051e4bcff71361ffd28d0024445ac5243075a86daed69'
	'ce3e5bfd5d9a2b4c5bc41993a0a1e3a2b03dd8a97145f0284bdf823cb66673ee0bbd4b6ea3fafb5d1709fcb4138163aa54ddb1ac57162748c7e192cd52a2eab4'
	'824108ea4b795ff2f24a22c759e709108b91085fa12d9c61da5772a8ba4ba14ac9092850803e524d31748fbc9dbece90f08f537312b201c237b5ba8356b1cee2')

package() {
	cd "$srcdir"
	install -Dm755 "${pkgname}-v${pkgver}" "${pkgdir}/usr/bin/dasel"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
	install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
}
