# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

# https://github.com/LargeModGames/spotatui/releases/download/v0.28.6/spotatui-linux-x86_64.tar.gz
_pkgauthor=LargeModGames
_pkgname=spotatui
pkgname=${_pkgname}-bin
pkgdesc="A Spotify client for the terminal written in Rust, powered by Ratatui"

pkgver=0.36.1
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


sha256sums=('b47ad91f512f5ae715df2888abf19ff0172c75de71b6423f836174bae8f8161e' '1dfb1788206bbf610ec3869fb3cd0d77c667bdd99d349df9e979c20b12a2743a')
sha256sums_x86_64=('7f447df02269b2aef38be4f50f36eecc3edc9531db66a0be0870aba35eff90c0')
package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
