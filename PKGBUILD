# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=yarlson
_pkgname=lnk
pkgname=${_pkgname}-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="🔗 Git-native dotfiles management that doesn't suck."
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_${_barch[1]}.tar.gz")

sha256sums_x86_64=('97c7c5c18f2f9d29caf5976019a2a12a24a5880fcbc0e97637c8c6e9676346af')
sha256sums_aarch64=('aa11c210cc935b5f79f8d0e7c4f43e6b605fba16ee0568724af0f87a8714b4a7')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
