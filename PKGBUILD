# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='goreleaser'
pkgver=v0.95.2
pkgrel=1
pkgdesc='Deliver Go binaries as fast and easily as possible'
url='https://goreleaser.com'
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')

depends=()
makedepends=()
optdepends=('nfpm: deb and rpm packager'
            'snapcraft: snap packager')

_source="https://github.com/${pkgname}/${pkgname}/releases/download/${pkgver}/${pkgname}_linux"

source_x86_64=("${_source}_x86_64.tar.gz")
sha256sums_x86_64=('a04f626fb853de48dde78d92ee08cdc188593a9ea9919fa56953703b8a8423bf')

source_i686=("${_source}_i386.tar.gz")
sha256sums_i686=('632dfb0cebf277ee24afcfe008802f1da3e53abb613cb09c920b85e3b70c1941')

source_aarch64=("${_source}_arm64.tar.gz")
sha256sums_aarch64=('a89f2da77a70366d97d7422916d761fb93fd760c9574f987cc28a7e19a3ea8af')

package() {
  # Bin
	rm -f "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# License
  install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
