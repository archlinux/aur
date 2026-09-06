# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ziinaio
_pkgname=zmate
pkgname=${_pkgname}-bin
pkgver=0.3.2
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Instant terminal sharing using Zellij and SSH"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE.md"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "SECURITY-${pkgver}.md::${_urlraw}/SECURITY.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[1]}")
sha256sums=('4a6e49b536b97ff4c90017dc3879b51595a9e31d44ae68a1738b32f17a81a6df'
            '7a85e97934342aec210961329c96aa4ce74b4ea06889a884be6590735f68d86b'
            '4cb473572e710dab2df9d520b329b29734cf12cd90f7e192aa2290c523d33cc0')
sha256sums_x86_64=('e68b1dec8409a69556553c922986896d378f5234e37c18656c8775898a99c7e5')
sha256sums_aarch64=('fc887f075230da48eae98bde03981d4ca3f46be6f3af6574d8a0d2fc55d39aa7')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "SECURITY-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/SECURITY.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
