# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='goreleaser'
pkgver=v0.101.0
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
sha256sums_x86_64=('923c35583db9edb9b0c91443106e605ccaea368a4bd7d1554ea3899bc3cdcc43')

source_i686=("${pkgname}_${pkgver}_linux_i386.tar.gz::${_basedownloadurl}/${pkgname}_linux_i386.tar.gz")
sha256sums_i686=('48632f7c5ecfe80dc08c15cb106c2064dd2b6560d970033b871835d233f14ffe')

source_aarch64=("${pkgname}_${pkgver}_linux_arm64.tar.gz::${_basedownloadurl}/${pkgname}_linux_arm64.tar.gz")
sha256sums_aarch64=('fd3dad73c8d50464f580f10baa3cc0a7023f2b8d40bf81f396e3c790c95dda73')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
