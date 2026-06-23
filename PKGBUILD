# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=subwaycookiecrunch
_gitname=zentorrent
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Just a CLI torrent downloader. No UI, no BS!"

pkgver=3.0.0
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
sha256sums=('0b59c86623b0f0126653456773046da420f63cc3f87b37687019710f1b5c4802'
            '5eea9322571742b0584f859e0ee9dfc3958e7d82c597cdc29bff2b623cf07beb')
sha256sums_x86_64=('65e5d7a13b9070d1814a4aaf125a457547d4fff73d0e6bc58fd0ceb2aeb13f3f')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
