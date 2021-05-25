# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='goreleaser-bin'
_pkgname="${pkgname%-bin}"
pkgver=v0.166.0
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
sha256sums_x86_64=('e19027d40975070b4e28ca649ec0e103346b08ce60923e538093c368b0a66b58')

source_i686=("${_pkgname}_${pkgver}_linux_i386.tar.gz::${_basedownloadurl}/${_pkgname}_linux_i386.tar.gz")
sha256sums_i686=('acd2df630cef87f5fe4577a878ad55e216532c8e27260d2d36939a0f27326e67')

source_aarch64=("${_pkgname}_${pkgver}_linux_arm64.tar.gz::${_basedownloadurl}/${_pkgname}_linux_arm64.tar.gz")
sha256sums_aarch64=('add5baec79e50bd16ee58ec526064a73599a5bd6ed8480b5680560785942fb74')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
