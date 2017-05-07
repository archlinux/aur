# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro_dot_org>
pkgname=otf-solbera-dnd-5e
_gitname=solbera-dnd-fonts
pkgver=1.0
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
sha256sums=('2f11c0e51007da046eba688939ba8804133568aaa4402d5a33f2ab51a88ae451')
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
	for font in "${_fontnames[@]}"; do
		find . -iname '*.otf' -execdir install -Dm 644 {} ${pkgdir}/usr/share/fonts/OTF/{} \;
	done
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
