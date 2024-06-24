# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='motoko-bin'
_pkgname="${pkgname%-bin}"
pkgver=0.3.0
pkgrel=1
pkgdesc='Based on Go modules, update a dependency to a major version.'
url='https://github.com/ldez/motoko'
arch=('x86_64' 'i686' 'aarch64')
license=('APACHE')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

depends=()
makedepends=()
optdepends=()

_basedownloadurl="https://github.com/ldez/${_pkgname}/releases/download/v${pkgver}"
_basearchive="${_pkgname}_v${pkgver}_linux"

source_x86_64=("${_basedownloadurl}/${_basearchive}_amd64.tar.gz")
sha256sums_x86_64=('413738cd0f1e4a6db82c13b2ca9267c7dd9a0de671404d38da726d0b07dc20d1')

source_i686=("${_basedownloadurl}/${_basearchive}_386.tar.gz")
sha256sums_i686=('c1e552b8db4563110f07f8e9d90e152086f7565736f15cd8018f4c9d6ec5e759')

source_aarch64=("${_basedownloadurl}/${_basearchive}_arm64.tar.gz")
sha256sums_aarch64=('6836b2ddebef83fc3de16b9ece8798eef6e2a0f3b5b48645daf546347fdcf435')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
