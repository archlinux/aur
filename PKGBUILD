# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='gti-bin'
_binname='gti'
pkgver=v1.1.0
pkgrel=1
pkgdesc='Just a silly git launcher, basically. Inspired by sl.'
url='https://github.com/ldez/gti'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('MIT')
provides=("${_binname}")
conflicts=("${_binname}-git" "${_binname}")

depends=()
makedepends=()

_url='https://github.com/ldez/gti'
_basedownloadurl="${_url}/releases/download/${pkgver}"
_basearchive="${_binname}_${pkgver}_linux"

source_x86_64=("${_basedownloadurl}/${_basearchive}_amd64.tar.gz")
sha256sums_x86_64=('7002f7915c115e4c47b0cdd1a7d6b4efaedc3061756c8a747fecd42de37ed325')

source_i686=("${_basedownloadurl}/${_basearchive}_386.tar.gz")
sha256sums_i686=('9aa93ce2d48b3af9b9e6ce2b5da5fbbdfe8567c9d39291823167a5bb1f4125b9')

source_armv7h=("${_basedownloadurl}/${_basearchive}_armv7.tar.gz")
sha256sums_armv7h=('570d34443763b47273d8024be83bb4d776738507a50bbbc29cfe1848e786bcfb')

source_aarch64=("${_basedownloadurl}/${_basearchive}_arm64.tar.gz")
sha256sums_aarch64=('4d1cd7b5e1ccd188b7d1c84c12e2bf67ec611ccdd71510fdf1aa4ca068b8080b')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${_binname}"
	install -Dm755 "${srcdir}/${_binname}" "${pkgdir}/usr/bin/${_binname}"

	# License
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_binname}/LICENSE"
}
