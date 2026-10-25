# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=ff
_pkgauthor=RobertFlexx
_pkgname=fastfind
pkgname=${_pkgname}-bin
pkgdesc="Fast, smart file search with fuzzy matching and natural language queries"

pkgver=2.5.2
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
sha256sums=('f4399ab2b9d9b0b30b2e9e6a9c391237da22818462fbdf418d708e6db02bf9f3'
            'ed004c147b9e5bfb92e66905a5747365ba915ab9938613a62beaca42401dc721'
            '03032f3a3b2cda5b47d8994ebcc63b6f39259eff117931f14640a3ba2649146c')
sha256sums_x86_64=('8e38fb829ab62b80530388cead6c93bbf7cfdaabccfdf3b91bd2b4fe92296a38')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "MANPAGE-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_appname}.1"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
