# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=benhoyt
_pkgname=goawk
pkgname=${_pkgname}-bin
pkgver=1.31.0
pkgrel=1
pkgdesc="A POSIX-compliant AWK interpreter written in Go, with CSV support"
arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_${_barch[0]}.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_${_barch[1]}.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_${_barch[2]}.tar.gz")
sha256sums_x86_64=('0b4a84798bb24479f2acd16dfb6e809046ca8d2572be52d621db59e3faba3bee')
sha256sums_i686=('e6d9a4b6acd32d465c831a85605b371902b522c1494d00b2f88ac0059ed6d8ed')
sha256sums_aarch64=('e744a944e9dcdd1e4fd7c0f51f6aefcba201dd5cf2038a91540efa0d0236ec31')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "docs/cover.md" "${pkgdir}/usr/share/doc/${pkgname}/COVER.md"
	install -Dm644 "docs/csv.md" "${pkgdir}/usr/share/doc/${pkgname}/CSV.md"
}
