# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='prm'
pkgver=v3.1.0
pkgrel=1
pkgdesc='Pull Request Manager for Maintainers'
url='https://ldez.github.io/prm/'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('APACHE')

provides=("${pkgname}")
conflicts=("${pkgname}" "${pkgname}-git")

depends=('git')
makedepends=()

_repourl='https://github.com/ldez/prm'
_basedownloadurl="${_repourl}/releases/download/${pkgver}"
_basearchive="${pkgname}_${pkgver}_linux"

source_x86_64=("${_basedownloadurl}/${_basearchive}_amd64.tar.gz")
sha256sums_x86_64=('3b9c108de3b0a08c57069135709ca0bb74f0dad4a80737841fc4e9ff25e16b47')

source_i686=("${_basedownloadurl}/${_basearchive}_386.tar.gz")
sha256sums_i686=('9029e7ca3bbc30eabdb0b4ec8f33e0f0f5496d64c2c74b723cb65597611fcab1')

source_armv7h=("${_basedownloadurl}/${_basearchive}_armv7.tar.gz")
sha256sums_armv7h=('af9f5afa60a72a06a94befd0796b030c8d11ad619b491a966a86869ff8364956')

source_aarch64=("${_basedownloadurl}/${_basearchive}_arm64.tar.gz")
sha256sums_aarch64=('64918934de72a0d9542574b34e933c6420d36b2c5a810549fccaac4e103bb244')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
