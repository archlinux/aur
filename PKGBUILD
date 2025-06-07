# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=rqlite
_pkgname=rqlite
pkgname=${_pkgname}-bin
pkgver=8.37.4
pkgrel=1
pkgdesc="A lightweight, distributed relational database, which uses SQLite as its storage engine"

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=('rqbench' 'rqlite' 'rqlited')
conflicts=("${_pkgname}" "${_pkgname}-git")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('8d629d1b758f9c3615bf75e9a7f1032b45eebd5973c577eb1e9f109c383d53f8'
            'ff8458e7ad3b311c8f033327342c5305e3ed1102c1535adfc06834e1a52f8d6d')
sha256sums_x86_64=('862478cf579cdd8e94c72629464b6e5d50ffafaa20b14fa80ba4603ed19ea022')


package() {
	cd "${srcdir}" || exit

	echo "Install: ${CARCH} - ${_pkgarch[@]}"

	install -Dm755 "${_pkgname}-v${pkgver}-linux-amd64/rqbench" "${pkgdir}/usr/bin/rqbench"
	install -Dm755 "${_pkgname}-v${pkgver}-linux-amd64/rqlited" "${pkgdir}/usr/bin/rqlited"
	install -Dm755 "${_pkgname}-v${pkgver}-linux-amd64/rqlite" "${pkgdir}/usr/bin/rqlite"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
