# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='gcg'
pkgver=v1.7.2
pkgrel=1
pkgdesc='A GitHub Changelog Generator. '
url='https://github.com/ldez/gcg'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('MIT')
provides=("${pkgname}")

depends=()
makedepends=()

_basedownloadurl="${url}/releases/download/${pkgver}"
_basearchive="${pkgname}_${pkgver}_linux"

source_x86_64=("${_basedownloadurl}/${_basearchive}_amd64.tar.gz")
sha256sums_x86_64=('19c8d46b7e2b76dc3ec63ba85ea41200f1eeb9308b84a298df41c6d6465c779e')

source_i686=("${_basedownloadurl}/${_basearchive}_386.tar.gz")
sha256sums_i686=('eb920250bc1d31756b44d2648bd83023786bc9c53a10a35e043e18367624454b')

source_armv7h=("${_basedownloadurl}/${_basearchive}_armv7.tar.gz")
sha256sums_armv7h=('7e27a9a95a50301c525422e0a1bca9a437f04247e63bf55bdf603cac59af1479')

source_aarch64=("${_basedownloadurl}/${_basearchive}_arm64.tar.gz")
sha256sums_aarch64=('5f8859364dcbaca87d9acf756ee69a01c4e926de8a9dd9c04cd0def93dc94b86')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENCE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
