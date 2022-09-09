# Maintainer: jmcb <joelsgp@protonmail.com>
pkgname=bros
pkgver=1.0.0
pkgrel=4
pkgdesc="Atari 800XL platformer"
arch=('any')
url="http://www.atarimania.com/game-atari-400-800-xl-xe-tobot-bros_5425.html"
license=('Unlicense')
depends=('altirra')
source=('https://archive.org/download/a8b_Bros_1989_KE_Soft_DE_en_a3/Bros_1989_KE_Soft_DE_en_a3.atr'
		"${pkgname}.desktop"
		"${pkgname}.svg")
sha256sums=('bb659633247cf99b90a8948ce499047503ebb76c31578f181b165ebc3b212009'
            '8af9e6ece4de8eaa8e06d176f266c46171402f4300ad25c2ab63b6521c0ff3ee'
            'a89a994991e926553a45a0b319efb464809670aa1dcb2a84260a22aa5e0adeb9')

package() {
	# game rom atr
	dest="${pkgdir}"/opt/${pkgname}
	install -Dm644 Bros_1989_KE_Soft_DE_en_a3.atr "${dest}"/Bros.atr
	# desktop entry
	share="${pkgdir}"/usr/share
	install -Dm644 ${pkgname}.desktop "${share}"/applications/${pkgname}.desktop
	install -Dm644 ${pkgname}.svg "${share}"/pixmaps/${pkgname}.svg
}
