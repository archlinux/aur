# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=hymkor
_pkgname=csvi
pkgname=${_pkgname}-bin
pkgdesc="Terminal CSV Editor"

pkgver=1.22.0
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
            '0d66d23a23c3139d82ad86d7ec3a784d9c5f28a36f764f538ae915438c8e0a57')
sha256sums_x86_64=('16c9663635ea331d7d1ea25e6122a2a9c234b9d7b3dce5262984fce781e44f12')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
