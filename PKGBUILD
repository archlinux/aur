# Maintainer: Jonathon Fernyhough <jonathon+m2x+dev>
pkgname=otf-solbera-dnd-5e
_gitname=solbera-dnd-fonts
pkgver=1.5
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
b2sums=('a14e9cb712fefa645f7ff30aff3576a2da00c9f347c1b9516eada814d731da5db4cdbe0f1c86f5a89ddf1a3a640429ed549c9be43ed4b2d0b7b1cf5c632a5f2d')
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
