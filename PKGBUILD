# Maintainer: Jonathon Fernyhough <jonathon+m2x+dev>
pkgname=otf-solbera-dnd-5e
_gitname=solbera-dnd-fonts
pkgver=1.4
pkgrel=1
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
b2sums=('70428774af41779d00b72a4dedd6c41f5be0a03bded2538de22e0669ae6569ffb1898601f85ba0c74c515c15953718bbb2b5be6069966e318e19a0a84dcacfed')
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
