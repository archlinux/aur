# Maintainer: 4censord <mail@business-insulting.de>
pkgname=gog-hacknet-labyrinths-dlc
pkgver=5.069
pkgrel=1
pkgdesc="Labyrinths DLC for Hacknet (GOG version) "
url="https://www.gog.com/game/hacknet_labyrinths"
license=('custom')
arch=('i686' 'x86_64')
depends=('gog-hacknet')
source=("local://hacknet_labyrinths_dlc_en_5_069_15083.sh")
sha256sums=('d925b55ddb36865aece63fcbce61ce9c9e4ceb851acebfb2d835ae13e439fd55')

package(){
	# Install game
	mkdir -p "${pkgdir}/opt/gog-hacknet"
	cp -a "${srcdir}/data/noarch/game" -T "${pkgdir}/opt/gog-hacknet/"
	chmod -R 644 "${pkgdir}/opt/gog-hacknet/"
	# required to be writable for creating new accounts, if not it fails with a exeption
	# doesnt seem to be actually written to.
	chmod -R 666 "${pkgdir}/opt/gog-hacknet/Content/DLC/People"

	find ${pkgdir} -type d -exec chmod +x {} +

	install -Dm 444 "${srcdir}/data/noarch/docs/Hacknet - Labyrinths DLC/End User License Agreement.txt" \
					"${pkgdir}/usr/share/licenses/${pkgname}/EULA"
}
