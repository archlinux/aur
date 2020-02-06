# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='goreleaser'
pkgver=v0.126.0
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
sha256sums_x86_64=('6c0145df61140ec1bffe4048b9ef3e105e18a89734816e7a64f342d3f9267691')

source_i686=("${pkgname}_${pkgver}_linux_i386.tar.gz::${_basedownloadurl}/${pkgname}_linux_i386.tar.gz")
sha256sums_i686=('740ee2ac4dba044a2a957ba0b7a1a89bab8c6e90dbe137da06d26afdb47b1f27')

source_aarch64=("${pkgname}_${pkgver}_linux_arm64.tar.gz::${_basedownloadurl}/${pkgname}_linux_arm64.tar.gz")
sha256sums_aarch64=('d5fe9a438cfb8a425a4049ee1197faf5702042107830056bcaaa66fcbeb01fb3')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
