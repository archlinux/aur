# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=epilande
_pkgname=repos
pkgname=${_pkgname}-bin
pkgdesc="Interactive CLI tool for managing multiple git repositories"

pkgver=1.0.2
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('x64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

options=(!strip)

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[0]}")
sha256sums=('4968aae2669870a43427f40882b344a5d7ce9f7a5f44e4bc5b64d8c45e97d0a8'
            'eddca6745edb6ecd2893c9b234a6364ed1f1c8b38f9c0dd413ae125a3ca4f701')
sha256sums_x86_64=('d5521cde9d97117a0d380b749e456a423bd23abc8f2969ad50c388364227767d')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
