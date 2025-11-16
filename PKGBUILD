# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=benhoyt
_pkgname=goawk
pkgname=${_pkgname}-bin
pkgver=1.30.1
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
sha256sums_x86_64=('c68dd7bb17a893224341adf1b9d1510a8f6e2b8dec917cb4680d84f7aa2937ca')
sha256sums_i686=('ed9c21339fe13bc976c2881dcebc7339271a0acdd28f52a8c4d2b20dda06a687')
sha256sums_aarch64=('fdaa31aa0448dec7cd17a0aad0281467e6918b20126476f59e6fa482814eb6a3')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "docs/cover.md" "${pkgdir}/usr/share/doc/${pkgname}/COVER.md"
	install -Dm644 "docs/csv.md" "${pkgdir}/usr/share/doc/${pkgname}/CSV.md"
}
