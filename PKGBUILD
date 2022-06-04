# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='motoko-bin'
_pkgname="${pkgname%-bin}"
pkgver=0.2.6
pkgrel=1
pkgdesc='Based on Go modules, update a dependency to a major version.'
url='https://github.com/ldez/motoko'
arch=('x86_64' 'i686' 'aarch64')
license=('APACHE')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

depends=()
makedepends=()
optdepends=()

_basedownloadurl="https://github.com/ldez/${_pkgname}/releases/download/v${pkgver}"
_basearchive="${_pkgname}_v${pkgver}_linux"

source_x86_64=("${_basedownloadurl}/${_basearchive}_amd64.tar.gz")
sha256sums_x86_64=('8b24710f277662ed9ab06acf094291ac2bd989469aaacd831b1e98b8c7c16dbb')

source_i686=("${_basedownloadurl}/${_basearchive}_386.tar.gz")
sha256sums_i686=('9d9226f426f428b358300ac59215d53b8a739af85e5cbe5e7857525c3ab7fd4e')

source_aarch64=("${_basedownloadurl}/${_basearchive}_arm64.tar.gz")
sha256sums_aarch64=('7fdd13ce98a6095e4019fedabd552bc727309c778ef20e12675ce25a3ed36358')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
