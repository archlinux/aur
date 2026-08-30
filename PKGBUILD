# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=subwaycookiecrunch
_gitname=zentorrent
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Just a CLI torrent downloader. No UI, no BS!"

pkgver=4.0.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'libstdc++')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
sha256sums=('4b8b77cd3163f3c6a7329edaee1e04ac48bc83e05b0a97b220319e21654f964c'
            '5eea9322571742b0584f859e0ee9dfc3958e7d82c597cdc29bff2b623cf07beb')
sha256sums_x86_64=('dc14e3b8f54da5e1546d991805368b8f9821d2a9da13e66901e032caf2ad1e6f')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
