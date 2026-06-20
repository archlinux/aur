# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=ff
_pkgauthor=RobertFlexx
_pkgname=fastfind
pkgname=${_pkgname}-bin
pkgdesc="Fast, smart file search with fuzzy matching and natural language queries"

pkgver=2.2.2
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('linux-glibc-amd64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_appname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source=("MANPAGE-${pkgver}.1::${_urlraw}/mandoc/${_appname}.1"
		"README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[0]}")
sha256sums=('237b7ba5078e1b922ee9e33609b3d4bb9f8810488d639d627a7c30148e479a05'
            'b54e2cc77fe5a2bd4c629f2d3ba6954e3fe5a0f46e98524ef45ccec47d0c72c4'
            '03032f3a3b2cda5b47d8994ebcc63b6f39259eff117931f14640a3ba2649146c')
sha256sums_x86_64=('19b923c05ec59f61bf212b3dc84c7ff8c27ef1ec77efea0a7a36a044b5f701fc')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "MANPAGE-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_appname}.1"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
