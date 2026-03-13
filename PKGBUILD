# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=AppachiTech
_pkgname=suvadu
_appname=suv
pkgname=${_pkgname}-bin
pkgdesc="A database-backed shell history replacement with fuzzy search, AI agent monitoring, and interactive TUI"

pkgver=0.1.2
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux' 'linux-aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}" "${_appname}")
conflicts=("${_pkgname}")

depends=('glibc' 'libgcc')

source=("README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[0]}-${_pkgvername}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[1]}-${_pkgvername}.tar.gz")
sha256sums=('abc6d36ddd096e600a2354045251ccbef284894151de46b3aad9a45ab194589a')
sha256sums_x86_64=('3e9df689c3676e9e7826d274529888b17f5c67ccf193f21af8b4cc5923e70373')
sha256sums_aarch64=('b2c8db00dccf7a4e932f58b3fffdf0b97faec9cc7b3e36f53f7ab9a06de0468b')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"
	ln -sf "/usr/bin/${_appname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
