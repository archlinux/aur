# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='lego-bin'
_pkgname="${pkgname%-bin}"
pkgver=v4.6.0
pkgrel=1
pkgdesc='Lets Encrypt client and ACME library written in Go'
url='https://go-acme.github.io/lego/'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}-git" "${_pkgname}")

depends=()
makedepends=()

_url='https://github.com/go-acme/lego'
_basedownloadurl="${_url}/releases/download/${pkgver}"
_basearchive="${_pkgname}_${pkgver}_linux"

source_x86_64=("${_basedownloadurl}/${_basearchive}_amd64.tar.gz")
sha256sums_x86_64=('c0c408788cdec96a4697300211c3944a050bb3d62ed3525a5409c136c94e09cb')

source_i686=("${_basedownloadurl}/${_basearchive}_386.tar.gz")
sha256sums_i686=('12ea2b9b67ad54f3fe53b5a47c934c2caf4c2d85befa33e3b8c4b1791e45dfdf')

source_armv7h=("${_basedownloadurl}/${_basearchive}_armv7.tar.gz")
sha256sums_armv7h=('df897c18794bac2011682ce4f414d9b701a1d563e164fef96d7cca6e7887a310')

source_aarch64=("${_basedownloadurl}/${_basearchive}_arm64.tar.gz")
sha256sums_aarch64=('f5cecda8880d04ffc394049852a797ec120aebf0203ab0f1b877a0cd89bb0b3e')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
