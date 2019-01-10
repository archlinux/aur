# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='goreleaser'
pkgver=v0.96.0
pkgrel=2
pkgdesc='Deliver Go binaries as fast and easily as possible'
url='https://goreleaser.com'
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')

depends=()
makedepends=()
optdepends=('nfpm: deb and rpm packager'
            'snapcraft: snap packager')

_source="https://github.com/${pkgname}/${pkgname}/releases/download/${pkgver}/${pkgname}_linux"

source_x86_64=("${pkgname}_${pkgver}_linux_x86_64.tar.gz::${_source}_x86_64.tar.gz")
sha256sums_x86_64=('9284da168af1aeb2a93fa55c8bdab28ef9f7b1af44e0e29ae7adb49ca464bf75')

source_i686=("${pkgname}_${pkgver}_linux_i386.tar.gz::${_source}_i386.tar.gz")
sha256sums_i686=('c6999d929fbcc642fb1ac133d9d80d34267516db00a7b4950637d6eb6ce73608')

source_aarch64=("${pkgname}_${pkgver}_linux_arm64.tar.gz::${_source}_arm64.tar.gz")
sha256sums_aarch64=('89a8824a6e3290056bd79621dfd2fbe63b78eb3de3e26e3b4f43313a47f990ef')

package() {
  # Bin
	rm -f "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# License
  install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
