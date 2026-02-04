# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=rqlite
_pkgname=rqlite
pkgname=${_pkgname}-bin
pkgver=9.3.21
pkgrel=1
pkgdesc="A lightweight, distributed relational database, which uses SQLite as its storage engine"

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=('rqbench' 'rqlite' 'rqlited')
conflicts=("${_pkgname}" "${_pkgname}-git")
depends=('glibc')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('eebaac1ed2a0deece5e8ea39c679bd2c8813aa8da3ec95cdda953b95ce349629'
            'ad8da7d9bad2ae7171e143274ad4cd432147306a1fb9abc9fcd0d9f105931b38')
sha256sums_x86_64=('8bc6f9cc24868be91d1e66ec871fda1ab19caab5df656b1795b50cdf7fcfc191')


package() {
	cd "${srcdir}" || exit

	echo "Install: ${CARCH} - ${_pkgarch[@]}"

	install -Dm755 "${_pkgname}-v${pkgver}-linux-amd64/rqbench" "${pkgdir}/usr/bin/rqbench"
	install -Dm755 "${_pkgname}-v${pkgver}-linux-amd64/rqlited" "${pkgdir}/usr/bin/rqlited"
	install -Dm755 "${_pkgname}-v${pkgver}-linux-amd64/rqlite" "${pkgdir}/usr/bin/rqlite"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
