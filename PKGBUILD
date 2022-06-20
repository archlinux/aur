# Maintainer: jmcb <joelsgp@protonmail.com>
pkgname=bros
pkgver=1.0.0
pkgrel=2
pkgdesc="Atari 800XL platformer"
arch=('any')
url="http://www.atarimania.com/game-atari-400-800-xl-xe-tobot-bros_5425.html"
license=('Unlicense')
depends=('altirra')
source=('https://archive.org/download/a8b_Bros_1989_KE_Soft_DE_en_a3/Bros_1989_KE_Soft_DE_en_a3.atr'
		"${pkgname}.desktop"
		"${pkgname}.png")
md5sums=('6f9164dc8e7710a08b11e747e80962c0'
		'23b04e32efa794095fe00b9ca75eea35'
		'0b7f361cb8652f6e7259c1dad5035b57')

package() {
	# game rom atr
	dest="${pkgdir}"/opt/${pkgname}
	install -Dm644 Bros_1989_KE_Soft_DE_en_a3.atr "${dest}"/Bros.atr
	# desktop entry
	share="${pkgdir}"/usr/share
	install -Dm644 ${pkgname}.desktop "${share}"/applications/${pkgname}.desktop
	install -Dm644 ${pkgname}.png "${share}"/icons/${pkgname}.png
}
