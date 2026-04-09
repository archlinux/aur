# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=programmersd21
_gitname=bangen
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="✨ Colorful animated ASCII banners in your terminal"

pkgver=2.2.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('glibc' 'zlib')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_gitversion}-${_barch[0]}")
sha256sums=('298593890fe312d5101bf191cd60b386bf70039f28f1c8959feb87bb7f59856a'
            'e47ee26134da1053f49b3ba41d8c376e772f1957afded5c1b71049aab6081bad')
sha256sums_x86_64=('c7e159d7a5fd76a897ea9ec24b8efa1151655c7a06c03bc01b34f9607b0b551d')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
