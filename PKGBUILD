# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=s0rg
_pkgname=decompose
pkgname=${_pkgname}-bin
pkgver=1.11.4
pkgrel=1
pkgdesc="Reverse-engineering tool for docker environments"
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_linux_${_barch[1]}.tar.gz")
sha256sums_x86_64=('f1b9a4cf2b01bec5a9e9b58b85599a847dfcc121834079327ade3bf742b9b59b')
sha256sums_aarch64=('0f4d53dbcf7dcd200be86559d1b5906d9ab904ae92065eb44b8be80d11abcfdb')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
