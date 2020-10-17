# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='gcg'
pkgver=v1.7.3
pkgrel=1
pkgdesc='A GitHub Changelog Generator. '
url='https://github.com/ldez/gcg'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('APACHE')
provides=("${pkgname}")

depends=()
makedepends=()

_basedownloadurl="${url}/releases/download/${pkgver}"
_basearchive="${pkgname}_${pkgver}_linux"

source_x86_64=("${_basedownloadurl}/${_basearchive}_amd64.tar.gz")
sha256sums_x86_64=('1dd27857204dbe7e77a83f3d1b33dc8daee5377ab273c8bd78db3cc2892a3258')

source_i686=("${_basedownloadurl}/${_basearchive}_386.tar.gz")
sha256sums_i686=('3ce45983c9c72c9d9038f0a5acb24d0440cf8ce66656f90bbcbd9b9cdf3ceb05')

source_armv7h=("${_basedownloadurl}/${_basearchive}_armv7.tar.gz")
sha256sums_armv7h=('c2844af0942aefb000360783b3718b1fd76b23946e72040be7b3254510148f35')

source_aarch64=("${_basedownloadurl}/${_basearchive}_arm64.tar.gz")
sha256sums_aarch64=('a81cd46eadcd0c703ab2ee871349f36cf3dc55743438af3b9e78b808abde99ca')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENCE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
