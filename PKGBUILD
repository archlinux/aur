# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='goreleaser'
pkgver=v0.136.0
pkgrel=1
pkgdesc='Deliver Go binaries as fast and easily as possible'
url='https://goreleaser.com'
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')

depends=()
makedepends=()
optdepends=('nfpm: deb and rpm packager'
	'snapcraft: snap packager')

_basedownloadurl="https://github.com/${pkgname}/${pkgname}/releases/download/${pkgver}"

source_x86_64=("${pkgname}_${pkgver}_linux_x86_64.tar.gz::${_basedownloadurl}/${pkgname}_linux_x86_64.tar.gz")
sha256sums_x86_64=('4f97546d728467a2e81171cf70f3f5785284b28dd11d7a7e7de3b7b1837f5ac3')

source_i686=("${pkgname}_${pkgver}_linux_i386.tar.gz::${_basedownloadurl}/${pkgname}_linux_i386.tar.gz")
sha256sums_i686=('9f839bedcf9c75675d07823b9326c92f0cba444a2d7a3ebbd443bddce89e0197')

source_aarch64=("${pkgname}_${pkgver}_linux_arm64.tar.gz::${_basedownloadurl}/${pkgname}_linux_arm64.tar.gz")
sha256sums_aarch64=('b917979d918c897780f9c3113d938f289202391c4028a79eb82eb731c21a745f')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
