# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=sunshine-syz
_gitname=comic-caret

_fontname=ComicCaret
_nerdfontname=ComicCaretNerdFont

pkgbase=${_gitname}
pkgname=(ttf-${_gitname} ttf-${_gitname}-nerd otf-${_gitname} otf-${_gitname}-nerd)
pkgdesc="A hand-drawn monospaced font for code and terminals, derived from Comic Shanns Mono"

pkgver=2.8
pkgrel=1
_gitversion=v${pkgver}

arch=('any')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${pkgbase}")

options=('!strip')

source=("${_ghurl}/releases/download/${_gitversion}/${_fontname}-${pkgver}.zip"
		"${_ghurl}/releases/download/${_gitversion}/${_nerdfontname}-${pkgver}.zip")
sha256sums=('cff8edd4a909af105f8c78fd3b0a20723449380086029345c753c8257611d3c5'
            'fc818327199227d09c8a1557120612e855be99f2ca51a9d76dd66a8c0e7e7982')


package_ttf-comic-caret() {
	cd "${srcdir}/" || exit

	pkgdesc+=' (TTF)'

	install -Dm644 ${_fontname}-*.ttf -t "${pkgdir}/usr/share/fonts/TTF/"

	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 ICON-LICENSES.txt "${pkgdir}/usr/share/licenses/${pkgname}/ICON-LICENSES"
}

package_ttf-comic-caret-nerd() {
	cd "${srcdir}/" || exit

	pkgdesc+=' (TTF) (Nerd)'

	install -Dm644 ${_nerdfontname}-*.ttf -t "${pkgdir}/usr/share/fonts/TTF/"

	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 ICON-LICENSES.txt "${pkgdir}/usr/share/licenses/${pkgname}/ICON-LICENSES"
}

package_otf-comic-caret() {
	cd "${srcdir}/" || exit

	pkgdesc+=' (OTF)'

	install -Dm644 ${_fontname}-*.otf -t "${pkgdir}/usr/share/fonts/OTF/"

	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 ICON-LICENSES.txt "${pkgdir}/usr/share/licenses/${pkgname}/ICON-LICENSES"
}

package_otf-comic-caret-nerd() {
	cd "${srcdir}/" || exit

	pkgdesc+=' (OTF) (Nerd)'

	install -Dm644 ${_nerdfontname}-*.otf -t "${pkgdir}/usr/share/fonts/OTF/"

	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 ICON-LICENSES.txt "${pkgdir}/usr/share/licenses/${pkgname}/ICON-LICENSES"
}
