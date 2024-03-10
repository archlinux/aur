# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='lego-bin'
_pkgname="${pkgname%-bin}"
pkgver=4.16.0
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
_basedownloadurl="${_url}/releases/download/v${pkgver}"
_basearchive="${_pkgname}_v${pkgver}_linux"

source_x86_64=("${_basedownloadurl}/${_basearchive}_amd64.tar.gz")
sha256sums_x86_64=('6bd416090c4bf09b92b966c56ae6b9aee6a8e945a1136ecff8ea5f24a47a97d5')

source_i686=("${_basedownloadurl}/${_basearchive}_386.tar.gz")
sha256sums_i686=('5b3542120a555a381b9fdb0b048a8d7089dc9b2ec9a2e318cf6f4334d768ed0d')

source_armv7h=("${_basedownloadurl}/${_basearchive}_armv7.tar.gz")
sha256sums_armv7h=('b2a2b3b67407fb663aa172e4e25c807173c0ec0d64ef536ec131139eace4190d')

source_aarch64=("${_basedownloadurl}/${_basearchive}_arm64.tar.gz")
sha256sums_aarch64=('baa93714a46a761219bc7af33e7fb81af1d6e384b5ddb80d9ce9b4c4471cf819')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
