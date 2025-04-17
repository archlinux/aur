# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=benhoyt
_pkgname=goawk
pkgname=${_pkgname}-bin
pkgver=1.29.1
pkgrel=1
pkgdesc="AWK interpreter written in go"
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
sha256sums_x86_64=('ac8dd2b2d9d52c9c163e22d718d75d4d10f500405d6e71ce2cee3007b6b5d7cc')
sha256sums_i686=('5210b83e9fc9ea4fd7aa37cc4b066742158f0699993468165df8ca07adfe9e54')
sha256sums_aarch64=('f3cc9566319ae4dea403a0667f5ad8fd2851f51f9030b4ac817d1b40ca24181a')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "docs/cover.md" "${pkgdir}/usr/share/doc/${pkgname}/COVER.md"
	install -Dm644 "docs/csv.md" "${pkgdir}/usr/share/doc/${pkgname}/CSV.md"
}
