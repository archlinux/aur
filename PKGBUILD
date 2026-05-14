# Maintainer: zoorat <zoorat [at] protonmail [dot] com>
# Old Maintainer: Firegem <mrfiregem [at] protonmail [dot] ch>

pkgname=dasel-bin
_pkgname=${pkgname%-bin}
pkgver=3.10.1
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

b2sums=('890ac314316c1f57ab6568406d1dc01c5acc5321900ebdddee1f52cec6b3f04b5905258a105da7699ea18b6f0d64cce62d60206ac85d9450e5611aef1e91981a'
	'fc06e1db2cd7753e9188087833b4fad2bdcb78165bef8dd26bab3760c6a76287e8a582e6dcfd61f09f2051e4bcff71361ffd28d0024445ac5243075a86daed69'
	'47970e5f60e7cc8e4e6fe92750874fac7d8ef768f29df2b6e375d7341ab73e41ef1056ab134fe00e3dbcfcab5f3fd0b446f1116fc6960b54d1317d332ea9a73c')

package() {
	cd "$srcdir"
	install -Dm755 "${pkgname}-v${pkgver}" "${pkgdir}/usr/bin/dasel"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
