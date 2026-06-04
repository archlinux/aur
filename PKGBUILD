# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=epilande
_pkgname=repos
pkgname=${_pkgname}-bin
pkgdesc="Interactive CLI tool for managing multiple git repositories"

pkgver=1.1.1
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
            'b49b27fe1279ba636800a13470cbc189d96a3def7bf5273414bee36a1bd36483')
sha256sums_x86_64=('85628f24fc6120bb1895d09131dd3a43fcb55ae9d73cdb869bd8b8d20cd1b96c')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
