# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='gcg'
pkgver=v1.7.1
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
sha256sums_x86_64=('b1b9bbbf557cdac2852374275f809f886ba76ad564aa0f114e1e837be2f2b69c')

source_i686=("${_basedownloadurl}/${_basearchive}_386.tar.gz")
sha256sums_i686=('c3f3624c998902940adc0271fff52b11bbf21c7503e901cdbd4f1f9a9594b763')

source_armv7h=("${_basedownloadurl}/${_basearchive}_armv7.tar.gz")
sha256sums_armv7h=('cbfdb1783088d3c8270f8f879786e25768596080fa758191ac5651d28358e1d0')

source_aarch64=("${_basedownloadurl}/${_basearchive}_arm64.tar.gz")
sha256sums_aarch64=('101c0f21ac78460f73aa3a06fe37e65c919ab86d8e84352ab59fee6aca8b07ff')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENCE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
