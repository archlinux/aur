# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='lego-bin'
_pkgname="${pkgname%-bin}"
pkgver=v4.2.0
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
sha256sums_x86_64=('3b0f6c715b79a6dc692e5c3f5890905bc4404a33469cecc2d0b60c5bf5c2076f')

source_i686=("${_basedownloadurl}/${_basearchive}_386.tar.gz")
sha256sums_i686=('fcb1cd1a1e8a7fe4e04abff376e9908b9625930b0341ae5ecb66a7029f76fa25')

source_armv7h=("${_basedownloadurl}/${_basearchive}_armv7.tar.gz")
sha256sums_armv7h=('0d2517db08be80c876ab47e059394b34de3fae27620c74c3f047c81598f32023')

source_aarch64=("${_basedownloadurl}/${_basearchive}_arm64.tar.gz")
sha256sums_aarch64=('1d5493d9f8d41494b9597d2b6add21ad064beb73d302da2c52b971dc466a82c6')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
