# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=dheerajshenoy
_pkgname=dodo
pkgname=${_pkgname}-bin
pkgdesc="A fast and configurable PDF reader built with Qt and MuPDF"

pkgver=0.5.6
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('amd64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('AGPL-3.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs' 'qt6-base' 'hicolor-icon-theme')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.deb::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_${_barch[0]}.deb")
sha256sums=('8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef'
            '692cfd1e9361fe43a14a666077dce75169362f34ccfefb23d796b9d7d9c0ae1a')
sha256sums_x86_64=('ca63bdd5a88ffa746624ad7e059e9ea3b6ac82bd9a37c72a2e47d561e1455c2f')


package() {
	cd "${pkgdir}/" || exit

	tar -xf "${srcdir}/data.tar.zst"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
