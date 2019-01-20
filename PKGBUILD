# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='motoko'
pkgver=v0.1.1
pkgrel=1
pkgdesc='Based on Go modules, update a dependency to a major version.'
url='https://github.com/ldez/motoko'
arch=('x86_64' 'i686' 'aarch64')
license=('APACHE')

depends=()
makedepends=()
optdepends=()

_basedownloadurl="https://github.com/ldez/${pkgname}/releases/download/${pkgver}"
_basearchive="${pkgname}_${pkgver}_linux"

source_x86_64=("${_basedownloadurl}/${_basearchive}_amd64.tar.gz")
sha256sums_x86_64=('b941c350b063ef5ba77f7c6baed0bfa10ded0f2bf8ebc74bc06d6e211420e0e8')

source_i686=("${_basedownloadurl}/${_basearchive}_386.tar.gz")
sha256sums_i686=('ef74b6e5c5c09a605a9bdeb2625eb804d04de8a2e5a5303e58a4441c7e1bfbe4')

source_aarch64=("${_basedownloadurl}/${_basearchive}_arm64.tar.gz")
sha256sums_aarch64=('27cd24fe787b996b452e107cf0328a3cc25db752154192c9591b777fb81a77ef')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
