# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='gti-bin'
_binname='gti'
pkgver=v1.5.0
pkgrel=1
pkgdesc='Just a silly git launcher, basically. Inspired by sl. (New version in Go)'
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
sha256sums_x86_64=('cc2cdad3713ff6efa1504d53036a60d7f7ded82813d877278259c844a594c433')

source_i686=("${_basedownloadurl}/${_basearchive}_386.tar.gz")
sha256sums_i686=('97bf5c722382fc5ed3b65d54f404cf8be09c59c61c0640f218577800edd0c1c4')

source_armv7h=("${_basedownloadurl}/${_basearchive}_armv7.tar.gz")
sha256sums_armv7h=('5ea1993e4a8831e0db7460e4faddb88c62c50d8509fb6e8d39e5c04ea2bb6be1')

source_aarch64=("${_basedownloadurl}/${_basearchive}_arm64.tar.gz")
sha256sums_aarch64=('a28759449c5d9e383ea58f2872e8f977763ef0fca41321f46b75b918da214727')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${_binname}"
	install -Dm755 "${srcdir}/${_binname}" "${pkgdir}/usr/bin/${_binname}"

	# License
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_binname}/LICENSE"
}
