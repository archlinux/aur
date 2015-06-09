# Maintainer: ajs124 < aur AT ajs124 DOT de >

pkgname=trosh
pkgver=1
pkgrel=2
pkgdesc="Trosh: The Movie: The Game"
arch=('any')
url="http://stabyourself.net/$pkgname/"
license=('custom')
depends=('love08')
_gamepkg="${pkgname}-linux.zip"
source=(${pkgname}.sh
        ${pkgname}.desktop
        http://stabyourself.net/dl.php?file=$pkgname/$pkgname-linux.zip)
sha256sums=('d2c71f94f9d240fbc2dd25e5d55a9d0863b350ebacbec72cd5ffccc2d591b67a' 
            'dec272d585d62de4daafa0c22e587a2b64cd92ac3eae5e45b03c1b98c1ce06e6' 
            '585342c1fd835017f83704be10a02151cfaafdae836ab89a5ffd0d7206b34465')

package() {
	# Install Data
	install -D -m755 "${srcdir}/${pkgname}.love" "${pkgdir}/usr/share/${pkgname}/${pkgname}.love"

	# Install Launcher
	install -D -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

	# Install Desktop
	install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

	# Install License
	install -D -m644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
