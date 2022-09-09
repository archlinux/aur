# Maintainer: jmcb <joelsgp@protonmail.com>
pkgname=bros
pkgver=1.0.0
pkgrel=3
pkgdesc="Atari 800XL platformer"
arch=('any')
url="http://www.atarimania.com/game-atari-400-800-xl-xe-tobot-bros_5425.html"
license=('Unlicense')
depends=('altirra')
source=('https://archive.org/download/a8b_Bros_1989_KE_Soft_DE_en_a3/Bros_1989_KE_Soft_DE_en_a3.atr'
		"${pkgname}.desktop"
		"${pkgname}.png")
sha256sums=('bb659633247cf99b90a8948ce499047503ebb76c31578f181b165ebc3b212009'
            '8af9e6ece4de8eaa8e06d176f266c46171402f4300ad25c2ab63b6521c0ff3ee'
            '89c7fbb7a5a2861df064c6010e13ac13d1f42157b5b9e3fee17a8732ff0f6da4')

package() {
	# game rom atr
	dest="${pkgdir}"/opt/${pkgname}
	install -Dm644 Bros_1989_KE_Soft_DE_en_a3.atr "${dest}"/Bros.atr
	# desktop entry
	share="${pkgdir}"/usr/share
	install -Dm644 ${pkgname}.desktop "${share}"/applications/${pkgname}.desktop
	install -Dm644 ${pkgname}.png "${share}"/pixmaps/${pkgname}.png
}
