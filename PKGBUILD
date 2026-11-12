# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=sunshine-syz
_gitname=comic-caret

_fontname=ComicCaret
_nerdfontname=ComicCaretNerdFont

pkgbase=${_gitname}
pkgname=(ttf-${_gitname} ttf-${_gitname}-nerd otf-${_gitname} otf-${_gitname}-nerd)
pkgdesc="A hand-drawn monospaced font for code and terminals, derived from Comic Shanns Mono"

pkgver=2.7
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
sha256sums=('b7466674cb82ea83afe51401e64902db76ac364f975fe8c897b9a0b0d0e30231'
            'e7580ea0c9ef3dedc6b504c0e5f1db453976acbac2ff6bc87d3324eb87b8a171')


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
