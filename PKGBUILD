# Maintainer: zoorat <zoorat [at] protonmail [dot] com>
# Old Maintainer: Firegem <mrfiregem [at] protonmail [dot] ch>

pkgname=dasel-bin
_pkgname=${pkgname%-bin}
pkgver=2.6.0
pkgrel=1

pkgdesc="Query and update data structures from the command line."
arch=('x86_64')
url="https://github.com/TomWright/dasel"
license=('MIT')

changelog="changelog.md"

source=(
	"${pkgname}-v${pkgver}.gz::${url}/releases/download/v${pkgver}/dasel_linux_amd64.gz"
	"https://raw.githubusercontent.com/TomWright/dasel/master/LICENSE"
)
b2sums=('831d10fc951d51dbee338e8c7b145b5801e9d1fa82f2ffe1f411ddfa0812e2db57118e614e11ed2b74ecd3115b8f6984d1bc9bb9a3c9d783a1c7cffc8f3dd50e'
	'fc06e1db2cd7753e9188087833b4fad2bdcb78165bef8dd26bab3760c6a76287e8a582e6dcfd61f09f2051e4bcff71361ffd28d0024445ac5243075a86daed69')

package() {
	cd "$srcdir"
	install -Dm755 "${pkgname}-v${pkgver}" "${pkgdir}/usr/bin/dasel"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
