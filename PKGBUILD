# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=ff
_pkgauthor=RobertFlexx
_pkgname=fastfind
pkgname=${_pkgname}-bin
pkgdesc="Fast, smart file search with fuzzy matching and natural language queries"

pkgver=2.5.1
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
sha256sums=('8bbed2c1b7dfbf55dda5f68324b6691c90439f0a91f52905ab8a575acdfc3a4e'
            '40a11bc9e4349f8138cc6d96fc01b22515e69e07bda8277f6d6507e244524120'
            '03032f3a3b2cda5b47d8994ebcc63b6f39259eff117931f14640a3ba2649146c')
sha256sums_x86_64=('06a1f6c0088d1858ea264b1590842e0ccac41588ff1a1581c9c5eb9b01cb4af3')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "MANPAGE-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_appname}.1"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
