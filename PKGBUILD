# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=yarlson
_pkgname=lnk
pkgname=${_pkgname}-bin
pkgver=0.7.0
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

sha256sums_x86_64=('cb46d1ea12e81140cf5f5ba761fbd5028b18a9451516d0a70d20a087f9f62d8d')
sha256sums_aarch64=('9d3480c9fc65ee24eeec25eb3308e74ae7c917600b9dcdb44cfc7d4cbd5513a0')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
