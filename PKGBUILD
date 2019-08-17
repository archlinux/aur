# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='gti-bin'
_binname='gti'
pkgver=v1.1.1
pkgrel=1
pkgdesc='Just a silly git launcher, basically. Inspired by sl.'
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
sha256sums_x86_64=('69e974b474a9f0ffc4c3527f75451474ff6c5fa2e3305649272477bd31d6c053')

source_i686=("${_basedownloadurl}/${_basearchive}_386.tar.gz")
sha256sums_i686=('bdddd645c492c914bc362ff599d5624f0b4ef5ac3b6b2465341ce85686241110')

source_armv7h=("${_basedownloadurl}/${_basearchive}_armv7.tar.gz")
sha256sums_armv7h=('d3148727cdea2580c93a497d1eeecd376b04cdbb7abe90cd00b64da510750ee7')

source_aarch64=("${_basedownloadurl}/${_basearchive}_arm64.tar.gz")
sha256sums_aarch64=('f38394bb27c08d78f41c10606d63152df7af01610342efd99924d0bd618065dd')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${_binname}"
	install -Dm755 "${srcdir}/${_binname}" "${pkgdir}/usr/bin/${_binname}"

	# License
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_binname}/LICENSE"
}
