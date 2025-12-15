# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=adamperkowski
_pkgname=jpu
pkgname=${_pkgname}-bin
pkgdesc="JuleProtonUp is a fast and lightweight ProtonUp alternative"

pkgver=0.0.1
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('BSD-3-Clause')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs' 'curl' 'openssl')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}")
sha256sums=('3d2b423fd4003b16721068737c94e354f686cadd01d9d725eae8618e6bcb099d'
            'ce1a90cbe9324a67637aa09459e78192a608c21696668dbc0f1468dec6c01d83')
sha256sums_x86_64=('a3cf4dcc2c2b48a441d4d0cca669cafc9c745b9769e48ba59ab2ba267774a1a5')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
