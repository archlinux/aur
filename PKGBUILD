# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='gcg'
pkgver=1.7.8
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
sha256sums_x86_64=('e2cd77550bed8890066e2a0eb6f8ad43f5c4400b7e71bff6b027460a603a3128')

source_i686=("${_basedownloadurl}/${_basearchive}_386.tar.gz")
sha256sums_i686=('4472919e75e4e4e946069ac2358ffc46ebe9b2576ac7c5d77dbad2ab5f56e3f8')

source_armv7h=("${_basedownloadurl}/${_basearchive}_armv7.tar.gz")
sha256sums_armv7h=('f205ce7ccc23ca4ddd4b4dab139ab8cf9fc2684ef2e9db761cf586dfe756dfc8')

source_aarch64=("${_basedownloadurl}/${_basearchive}_arm64.tar.gz")
sha256sums_aarch64=('46d825abba95cb9679f560277da3e7acab059075b89bd105539e19b4bdf1c9a7')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENCE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
