# Maintainer: zoorat <zoorat [at] protonmail [dot] com>
# Old Maintainer: Firegem <mrfiregem [at] protonmail [dot] ch>

pkgname=dasel-bin
_pkgname=${pkgname%-bin}
pkgver=3.8.0
pkgrel=1

pkgdesc="Query and update data structures from the command line."
arch=('x86_64')
url="https://github.com/TomWright/dasel"
license=('MIT')

changelog="changelog.md"

source=(
	"${pkgname}-v${pkgver}.gz::${url}/releases/download/v${pkgver}/dasel_linux_amd64.gz"
	"https://raw.githubusercontent.com/TomWright/dasel/master/LICENSE"
	"https://raw.githubusercontent.com/TomWright/dasel/master/README.md"
)

b2sums=('c0a71bde5e8e19f160a7b0a5665d30076f3fe52c21e0ae77c4773206fefa7af719c6b031db296049bea1d0e41b0cd2d6cd4181377aeedb1630073fde66acf93f'
	'fc06e1db2cd7753e9188087833b4fad2bdcb78165bef8dd26bab3760c6a76287e8a582e6dcfd61f09f2051e4bcff71361ffd28d0024445ac5243075a86daed69'
	'b84a0d427b7c8b7f0b2280ff39437abf7d6a04588dcf9ac87ef5c054f673c678bfaf91875e7eb1a8182c75a84762d113d0cb6494c1a2ef05d374543d8a2baa84')

package() {
	cd "$srcdir"
	install -Dm755 "${pkgname}-v${pkgver}" "${pkgdir}/usr/bin/dasel"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
