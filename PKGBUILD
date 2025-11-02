# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=benhoyt
_pkgname=goawk
pkgname=${_pkgname}-bin
pkgver=1.30.0
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
sha256sums_x86_64=('8247cebc687e0014414b2ae6f6de7e785beb43f76683234c84cff57a5330ad6d')
sha256sums_i686=('369fc80b38276ae00b1ef756388bb5ece02025193ee647d842055baff5b31981')
sha256sums_aarch64=('847c6c1e0bde20458271361e6d9da2d75e2bf291f6a6b638e7e128f7337b3426')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "docs/cover.md" "${pkgdir}/usr/share/doc/${pkgname}/COVER.md"
	install -Dm644 "docs/csv.md" "${pkgdir}/usr/share/doc/${pkgname}/CSV.md"
}
