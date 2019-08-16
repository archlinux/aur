# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='gti-bin'
_binname='gti'
pkgver=v1.0.0
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
sha256sums_x86_64=('1579b6310c2a43374fd0c9c5ffa969ee920ef59f760f6669d43883eb33a01dac')

source_i686=("${_basedownloadurl}/${_basearchive}_386.tar.gz")
sha256sums_i686=('df2c145101e8edae3b2f060dedc1472530ef601af765da247221bb1ae0901c2e')

source_armv7h=("${_basedownloadurl}/${_basearchive}_armv7.tar.gz")
sha256sums_armv7h=('666413b4cac31f1fc2db47a5f43dea8d2be5170c5f001e4e4debcd460b65eeec')

source_aarch64=("${_basedownloadurl}/${_basearchive}_arm64.tar.gz")
sha256sums_aarch64=('38cec5ede344ea501ef3c73683f0b8439a76fd87639eef1912a91f76a84a83b6')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${_binname}"
	install -Dm755 "${srcdir}/${_binname}" "${pkgdir}/usr/bin/${_binname}"

	# License
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_binname}/LICENSE"
}
