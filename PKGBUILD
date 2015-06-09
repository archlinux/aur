# Maintainer: ajs124 < aur AT ajs124 DOT de >

pkgname=notpacman
pkgver=1.0.4
pkgrel=1
pkgdesc="not pacman with physics"
arch=('any')
url="http://stabyourself.net/notpacman/"
license=('CCPL:by-nc-sa')
depends=('love07')
_gamepkg="${pkgname}-linux.zip"
source=(${pkgname}.sh
	${pkgname}.desktop
	http://stabyourself.net/dl.php?file=${pkgname}-1004/${_gamepkg})
sha256sums=('b7bccecdde839f2692e549f6f3f4e4022d24c46a09d6b12f947a3d38d1327648'
            '5abee28bbe2a4b854f54d425d5de5462db90a60c8b3de1641c2d3e4c9de34c16'
            '9ec13bb0737d69c8954a5012ab3c84917f8db6285f74605c6faac7592a7ef2fc')

package() {
	# Install Data
	install -D -m755 "${srcdir}/not_pacman.love" "${pkgdir}/usr/share/games/${pkgname}/${pkgname}.love"

	# Install Launcher
	install -D -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

	# Install Desktop
	install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
