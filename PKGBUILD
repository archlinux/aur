# Maintainer: Jonathon Fernyhough <jonathon+m2x+dev>
pkgname=otf-solbera-dnd-5e
_gitname=solbera-dnd-fonts
pkgver=1.3
pkgrel=2
license=('Custom: CC-BY-SA-4.0')
pkgdesc='A collection of unrestricted DND5e-compatible typefaces'
arch=('any')
provides=(
	'otf-bookinsanity'
	'otf-dungeon-drop-case'
	'otf-mr-eaves'
	'otf-nodesto-caps-condensed'
	'otf-scaly-sans'
	'otf-solbera-imitation'
	'otf-zatanna-misdirection'
)
conflicts=("${pkgname}-git")
url="https://github.com/jonathonf/${_gitname}"
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v${pkgver}.tar.gz")
b2sums=('2433dcec567c264b0c808416e45e36c6636addf7c38c37d645e043940ee27120659e1a33582efb72cd4136344779c1d8aaddc342c2d95d19783f6ebe3f741b09')
_fontnames=(
	'Bookinsanity'
	'Dungeon Drop Case'
	'Mr Eaves'
	'Nodesto Caps Condensed'
	'Scaly Sans'
	'Solbera Imitation'
	'Zatanna Misdirection'
)

package() {
	cd "${_gitname}-${pkgver}"
	find . -iname '*.otf' -execdir install -Dm 644 {} "${pkgdir}"/usr/share/fonts/OTF/{} \;
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
