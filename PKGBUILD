# Maintainer: jmcb <joelsgp@protonmail.com>
pkgname=bros
pkgver=1.0.0
pkgrel=5
pkgdesc="Atari 800XL platformer"
arch=('any')
url="http://www.atarimania.com/game-atari-400-800-xl-xe-tobot-bros_5425.html"
license=('Unlicense')
depends=('altirra')
source=('https://archive.org/download/a8b_Bros_1989_KE_Soft_DE_en_a3/Bros_1989_KE_Soft_DE_en_a3.atr'
		"${pkgname}"
		"${pkgname}.desktop"
		"${pkgname}.svg")
sha256sums=('bb659633247cf99b90a8948ce499047503ebb76c31578f181b165ebc3b212009'
            '6a2a1820d17fa32f8be9bd6f03a991f338042f0f6d17029611a7f730a3c5cca1'
            'bbd65273437abf1ab59eb192c899441ed76ec783fbc28c7e6d3371fcd31752a9'
            'a89a994991e926553a45a0b319efb464809670aa1dcb2a84260a22aa5e0adeb9')

package() {
	# game rom atr
	dest="${pkgdir}"/opt/${pkgname}
	install -Dm644 Bros_1989_KE_Soft_DE_en_a3.atr "${dest}"/Bros.atr
	# launch script
	install -D ${pkgname} "${dest}"/${pkgname}
	# desktop entry
	share="${pkgdir}"/usr/share
	install -Dm644 ${pkgname}.desktop "${share}"/applications/${pkgname}.desktop
	install -Dm644 ${pkgname}.svg "${share}"/pixmaps/${pkgname}.svg
}
