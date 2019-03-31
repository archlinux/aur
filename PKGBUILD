# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='goreleaser'
pkgver=v0.104.1
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
sha256sums_x86_64=('6698778c44798c665813827e426a99ce4fa75bd4ac0b7670d88c6b882d9c0a4d')

source_i686=("${pkgname}_${pkgver}_linux_i386.tar.gz::${_basedownloadurl}/${pkgname}_linux_i386.tar.gz")
sha256sums_i686=('d38f6832c04e399a4ee52244e54297db064116a501438f0e1f65eebbf95174e7')

source_aarch64=("${pkgname}_${pkgver}_linux_arm64.tar.gz::${_basedownloadurl}/${pkgname}_linux_arm64.tar.gz")
sha256sums_aarch64=('bfaff6d23a4985daeef46511cd2538a1a550b6b316767135abaad15f3adb2eb7')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
