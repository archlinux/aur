# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='goreleaser'
pkgver=v0.102.0
pkgrel=1
pkgdesc='Deliver Go binaries as fast and easily as possible'
url='https://goreleaser.com'
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')

depends=()
makedepends=()
optdepends=('nfpm: deb and rpm packager'
	'snapcraft: snap packager')

_basedownloadurl="https://github.com/${pkgname}/${pkgname}/releases/download/${pkgver}/"

source_x86_64=("${pkgname}_${pkgver}_linux_x86_64.tar.gz::${_basedownloadurl}/${pkgname}_linux_x86_64.tar.gz")
sha256sums_x86_64=('614e44dd49ebd643f8357ba39aa7a7b591359b7c7c45f12c0ebb2df6e99338a6')

source_i686=("${pkgname}_${pkgver}_linux_i386.tar.gz::${_basedownloadurl}/${pkgname}_linux_i386.tar.gz")
sha256sums_i686=('d495896951275fe7cada507eb03ced893bf79535bd9a4cf24a0dc68bb0f5080b')

source_aarch64=("${pkgname}_${pkgver}_linux_arm64.tar.gz::${_basedownloadurl}/${pkgname}_linux_arm64.tar.gz")
sha256sums_aarch64=('11633f7eccd9500400954590407c03ca97f2df8af0db99dd63adf39ba0f9157d')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
