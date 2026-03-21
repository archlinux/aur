# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=hymkor
_pkgname=csvi
pkgname=${_pkgname}-bin
pkgdesc="Terminal CSV Editor"

pkgver=1.23.1
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('amd64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.zip::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-linux-${_barch[0]}.zip")
sha256sums=('3aae49b6287bf4a3177320ca7a67b00ffa13562db7e8d6ba9f2ac4984819eab0'
            'bea0b3e19fecf54135eb852ad1f743b2fc358d821ed29fc85bcfd185e99b5860')
sha256sums_x86_64=('b76394837323ec1a28404286e1c8c459cb639ac1d694f1c4c8a1125cf6024916')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
