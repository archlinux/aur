# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

# https://github.com/LargeModGames/spotatui/releases/download/v0.28.6/spotatui-linux-x86_64.tar.gz
_pkgauthor=LargeModGames
_pkgname=spotatui
pkgname=${_pkgname}-bin
pkgdesc="A Spotify client for the terminal written in Rust, powered by Ratatui"

pkgver=0.38.2
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs' 'openssl')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[0]}.tar.gz")


sha256sums=('b47ad91f512f5ae715df2888abf19ff0172c75de71b6423f836174bae8f8161e' '1514ee665e9d14f34e261b477efcccaa3adf32c88788f670aceedc4c493077bb')
sha256sums_x86_64=('e848d427c0ad9de7fcfb92b2e02448f739e23812b8cabc4c118727829e0b5c04')
package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
