# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='lego'
pkgver=v2.7.0
pkgrel=1
pkgdesc='Lets Encrypt client and ACME library written in Go'
url='https://go-acme.github.io/lego/'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}-git")

depends=()
makedepends=()

_url='https://github.com/go-acme/lego'
_basedownloadurl="${_url}/releases/download/${pkgver}"
_basearchive="${pkgname}_${pkgver}_linux"

source_x86_64=("${_basedownloadurl}/${_basearchive}_amd64.tar.gz")
sha256sums_x86_64=('d6cf117ca91e5a648bb465222f3d26914aa044a81b2697e6a6dcf038d33897ee')

source_i686=("${_basedownloadurl}/${_basearchive}_386.tar.gz")
sha256sums_i686=('7f30874eefe016825673ee332802567c6086154ebde538da666bb938f48b8cf4')

source_armv7h=("${_basedownloadurl}/${_basearchive}_armv7.tar.gz")
sha256sums_armv7h=('8eb20acb2a2aeea768e228a3221534c901775ef48e5c67d9aa695686359f5085')

source_aarch64=("${_basedownloadurl}/${_basearchive}_arm64.tar.gz")
sha256sums_aarch64=('9d8f6c33784f818f252a9eb5151f133cfc18ea8bc3540c0feadc93bed0d7172c')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
