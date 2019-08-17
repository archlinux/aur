# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='gti-bin'
_binname='gti'
pkgver=v1.4.0
pkgrel=1
pkgdesc='Just a silly git launcher, basically. Inspired by sl. (New version in Go)'
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
sha256sums_x86_64=('b87f6e2769cd9d3f913de8511ff8279831a9e086a64fb16bc2b5271f2e61f5ff')

source_i686=("${_basedownloadurl}/${_basearchive}_386.tar.gz")
sha256sums_i686=('93b7cab9e924093fe59f543f1976b6bf076907754c73faa76f56cd8282491788')

source_armv7h=("${_basedownloadurl}/${_basearchive}_armv7.tar.gz")
sha256sums_armv7h=('1450461f3436018599a2e94f8a984a5d58017142dda97aab73eb6cb42ae52482')

source_aarch64=("${_basedownloadurl}/${_basearchive}_arm64.tar.gz")
sha256sums_aarch64=('9d64193d99964e85d49330affecc4bcf3e6816a9de67ba8b63d7384f68dde448')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${_binname}"
	install -Dm755 "${srcdir}/${_binname}" "${pkgdir}/usr/bin/${_binname}"

	# License
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_binname}/LICENSE"
}
