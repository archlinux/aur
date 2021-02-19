# Maintainer: Jonathon Fernyhough <jonathon+m2x+dev>
pkgname=otf-solbera-dnd-5e
_gitname=solbera-dnd-fonts
pkgver=1.2
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
b2sums=('38f9d1a416d809cc3b96ede716a4b96f7e43a94243398feb82375ba674b51cbacd3c50236b229c6099af4f94706ba5b6e5fa1e2a6464fe215736064498d994bc')
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
