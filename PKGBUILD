# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=ff
_pkgauthor=RobertFlexx
_pkgname=fastfind
pkgname=${_pkgname}-bin
pkgdesc="Fast, smart file search with fuzzy matching and natural language queries"

pkgver=2.5.0
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
sha256sums=('35bca8886777566cb5d3a33bde9e70115db518d11da9f91fa7eabad09e873631'
            '97f3ddd681cae8e688f2fd3242362477da41aac958f660510770757d9364714b'
            '03032f3a3b2cda5b47d8994ebcc63b6f39259eff117931f14640a3ba2649146c')
sha256sums_x86_64=('7125a0c8975304c8116ab7b4db44641154bc3baaf0e8f1e3025ea3b8faa33b68')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "MANPAGE-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_appname}.1"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
