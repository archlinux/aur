# Maintainer: jmcb <joelsgp@protonmail.com>
pkgname=bros
pkgver=1.0.0
pkgrel=1
pkgdesc="An 8-bit Atari computer emulator, on Wine"
arch=('any')
url="http://www.atarimania.com/game-atari-400-800-xl-xe-tobot-bros_5425.html"
license=('Unlicense')
depends=('altirra')
provides=()
source=('https://archive.org/download/a8b_Bros_1989_KE_Soft_DE_en_a3/Bros_1989_KE_Soft_DE_en_a3.atr'
		"${pkgname}.desktop"
		"${pkgname}.png")
noextract=()
md5sums=('6f9164dc8e7710a08b11e747e80962c0'
		'7ad829f1780e01ee3999560268783fe2'
		'b4a23bffe9181a496fdf5ad1dd6eebbb')

package() {
	# game rom atr
	dest="${pkgdir}"/opt/${pkgname}
	install -Dm644 Bros_1989_KE_Soft_DE_en_a3.atr "${dest}"/Bros.atr
	# desktop entry
	share="${pkgdir}"/usr/share
	install -Dm644 ${pkgname}.desktop "${share}"/applications/${pkgname}.desktop
	install -Dm644 ${pkgname}.png "${share}"/icons/${pkgname}.png
}
