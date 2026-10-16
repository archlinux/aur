# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=hymkor
_pkgname=jegan
pkgname=${_pkgname}-bin
pkgdesc="Terminal JSON Editor"

pkgver=0.7.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'i686')
_barch=('linux-amd64' 'linux-386')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.zip::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}.zip")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.zip::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[1]}.zip")
sha256sums=('8c0a9244db57f92567321331916a35ed27abfa21d0457df155f62df6cb058dc1'
            'fd9969539fce59482b25c075e421b36612e416739259f9d2a1a6ce31e3a00570')
sha256sums_x86_64=('a43371867f5f76a547999b8b5755bed9d0dd9aea07f8acbbd4628ec6bbeee12e')
sha256sums_i686=('a12dac7eee5eb71767e200b550bd356d47b77e7dd483bd35023f6943bd8957f5')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
