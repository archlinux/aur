# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='lego'
pkgver=v3.4.0
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
sha256sums_x86_64=('48d043189a750f03316d976a8f21cd60c40773365efad1dfd246629f09a79457')

source_i686=("${_basedownloadurl}/${_basearchive}_386.tar.gz")
sha256sums_i686=('4e8183d2a6b21d1292136fb1ab8c14cb50d4762daafba54e058d483591700752')

source_armv7h=("${_basedownloadurl}/${_basearchive}_armv7.tar.gz")
sha256sums_armv7h=('5607798df82897dcf97fa707743431ac348726be5daec4306ea6b29566046824')

source_aarch64=("${_basedownloadurl}/${_basearchive}_arm64.tar.gz")
sha256sums_aarch64=('a4147926f21e4ce99db721a1aaed01fac6ee98db242cab0ec3565a7bca069a52')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
