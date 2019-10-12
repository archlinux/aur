# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='lego'
pkgver=v3.1.0
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
sha256sums_x86_64=('cb292e45025b5891c6eecd10924537c57f395be8218bd2135bd7ac8a06ea6585')

source_i686=("${_basedownloadurl}/${_basearchive}_386.tar.gz")
sha256sums_i686=('b530ce5e0b4b292d71feaac3699136a642db6d3ae35027675901afd0b4a27321')

source_armv7h=("${_basedownloadurl}/${_basearchive}_armv7.tar.gz")
sha256sums_armv7h=('693a446005cd0d23a5ecc655ab4f1dbe0090bd5e36d66b4494b425f0ec0f2f9c')

source_aarch64=("${_basedownloadurl}/${_basearchive}_arm64.tar.gz")
sha256sums_aarch64=('628a2c2f99139625f0906a2fc6a019e47e4266236838fae3649c9f97db7c445e')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
