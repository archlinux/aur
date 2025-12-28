# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=epilande
_pkgname=repos
pkgname=${_pkgname}-bin
pkgdesc="Interactive CLI tool for managing multiple git repositories"

pkgver=1.0.0
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
            'df58fe9a33df1569c06d5f2866e27a3888dce9e6803fe401c41c4c711a2d2ff8')
sha256sums_x86_64=('bf3720a7bfec9301654a2367f9d7b40495f22b33c2a1d45cbef181bffd01c799')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
