# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro_dot_org>
pkgname=otf-solbera-dnd-5e
_gitname=solbera-dnd-fonts
pkgver=1.1
pkgrel=1
license=('Custom: CC-BY-SA-4.0')
pkgdesc='A collection of unrestricted DND5e-compatible typefaces'
arch=('any')
provides=(
	'otf-bookinsanity'
	'otf-mr-eaves'
	'otf-nodesto-caps-condensed'
	'otf-scaly-sans'
	'otf-solbera-imitation'
	'otf-zatanna-misdirection'
)
conflicts=("${pkgname}-git")
url="https://github.com/jonathonf/${_gitname}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jonathonf/${_gitname}/archive/v${pkgver}.tar.gz")
sha256sums=('ac87f99735521b2a193437801a8571160d619c2d3a1bb61aef2966afbe64a1ff')
_fontnames=(
	'Bookinsanity'
	'Mr Eaves'
	'Nodesto Caps Condensed'
	'Scaly Sans'
	'Solbera Imitation'
	'Zatanna Misdirection'
)

package() {
	cd "${_gitname}-${pkgver}"
	find . -iname '*.otf' -execdir install -Dm 644 {} ${pkgdir}/usr/share/fonts/OTF/{} \;
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
