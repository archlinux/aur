# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='goreleaser-bin'
_pkgname="${pkgname%-bin}"
pkgver=v0.139.0
pkgrel=1
pkgdesc='Deliver Go binaries as fast and easily as possible'
url='https://goreleaser.com'
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

depends=()
makedepends=()
optdepends=('nfpm: deb and rpm packager'
	'snapcraft: snap packager')

_basedownloadurl="https://github.com/${_pkgname}/${_pkgname}/releases/download/${pkgver}"

source_x86_64=("${_pkgname}_${pkgver}_linux_x86_64.tar.gz::${_basedownloadurl}/${_pkgname}_linux_x86_64.tar.gz")
sha256sums_x86_64=('6b37a8a1125b8878020a4c222bb74c199e89b6fbc5699678c9e06bbebf41b3df')

source_i686=("${_pkgname}_${pkgver}_linux_i386.tar.gz::${_basedownloadurl}/${_pkgname}_linux_i386.tar.gz")
sha256sums_i686=('18efe1833ac109e98c1152b060aaf3b26def1e5bfa999ae6218dc69b6ed66258')

source_aarch64=("${_pkgname}_${pkgver}_linux_arm64.tar.gz::${_basedownloadurl}/${_pkgname}_linux_arm64.tar.gz")
sha256sums_aarch64=('6f8bda4aa5714696ffde66ffc1f642d3f4d14bb744223eacc63e84df602a751a')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
