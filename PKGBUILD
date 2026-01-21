# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=dheerajshenoy
_pkgname=dodo
pkgname=${_pkgname}-bin
pkgdesc="A fast and configurable PDF reader built with Qt and MuPDF"

pkgver=0.6.0
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
            'c410974d5ba2b7bb957b0edef16f0d5a7d95483c013c77f89cbf22f69d322612')
sha256sums_x86_64=('45832e6e4ba4e5a8a18e0547cb52abaee646db19baacc4a4514b3cb1bcbef173')


package() {
	cd "${pkgdir}/" || exit

	tar -xf "${srcdir}/data.tar.zst"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
