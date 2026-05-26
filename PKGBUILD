# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

# https://github.com/LargeModGames/spotatui/releases/download/v0.28.6/spotatui-linux-x86_64.tar.gz
_pkgauthor=LargeModGames
_pkgname=spotatui
pkgname=${_pkgname}-bin
pkgdesc="A Spotify client for the terminal written in Rust, powered by Ratatui"

pkgver=0.38.4
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


sha256sums=('b47ad91f512f5ae715df2888abf19ff0172c75de71b6423f836174bae8f8161e' 'c6862f782185c3bfddf3e28acd3260dc94561b9fb9510d7bcebfbbab51393145')
sha256sums_x86_64=('30138e154746f62a2da1c6912a348de6ca5a55357c85b5ce42cf21cc0df596b2')
package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
