# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='lego-bin'
_pkgname="${pkgname%-bin}"
pkgver=v4.0.1
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
sha256sums_x86_64=('d9e4f58d185e929a0004a6faa8f0afa12a39e7c311992d4807758150d51ff660')

source_i686=("${_basedownloadurl}/${_basearchive}_386.tar.gz")
sha256sums_i686=('efcf1bd32204e4bd4f13b447be69275604fb39c2c6d7aff1d259c039efdca103')

source_armv7h=("${_basedownloadurl}/${_basearchive}_armv7.tar.gz")
sha256sums_armv7h=('4936b61df00baf60ced71b42c58229c4f7d9e364cca06d9270f44951702edbaf')

source_aarch64=("${_basedownloadurl}/${_basearchive}_arm64.tar.gz")
sha256sums_aarch64=('250a8d480d9d9d8d37a7dd3ca9cc79458fa566532cf2882300124ec5454e8241')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
