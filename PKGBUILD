# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Ben Boyter <ben@boyter.org>

_pkgauthor=boyter
_pkgname=lc
pkgname=${_pkgname}-bin
pkgdesc="A command line application which scans directories and identifies what software license things are under"

pkgver=1.3.1
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('AGPL-3.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.zip::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[0]}.zip")
sha256sums=('b380fb7e30f6c857e82dea6ce9a5a50075282ba5058a08fec975e7df4a1f32a1'
            'c6110d0a135974afec2b9aeb557df08703c3e1317d7d96d97da009fb28c86533')
sha256sums_x86_64=('f076ddae2ed7a5a1265c7d811260b158044f8ab990c9a052e07e410ae3467db9')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
