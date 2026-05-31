# Contributor: Philipp Schwarz <fidschi_aur@temporaryforwarding.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Dany Martineau <dany.luc.martineau at gmail.com>
# Contributor: moostik <mooostik_at_gmail.com>
# Maintainer: Michael Kogan <michael.kogan at gmx.net>

pkgname=car
pkgver=2024.06
pkgrel=1
url="https://car.rene-grothmann.de/"
pkgdesc="Compass and Ruler is a dynamic geometry program"
arch=('any')
license=('GPL')
depends=('java-runtime=26' 'xdg-utils')
source=("https://master.dl.sourceforge.net/project/zirkel/zirkel.jar"
	"https://zirkel.sourceforge.net/images/ZuL-Logo.png"
	"${pkgname}.desktop"
	"${pkgname}.sh")
md5sums=('2e75b92515ba854d877149926f00f297'
         '44756f64232dcba353fda79564468f68'
         '94fdcd79f877188507c68434c2a80e67'
         'fbed86abe156c2091ea42ef989204bb3')

package() {
	cd "${srcdir}/zirkel"
	install -Dm644 "${srcdir}/zirkel.jar" \
	  "${pkgdir}/usr/share/java/car/zirkel.jar"
	install -d "${pkgdir}/usr/share/pixmaps"
	install -Dm644 "${srcdir}/ZuL-Logo.png" \
	  "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${srcdir}/${pkgname}.desktop" \
	  "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	#install -d "$pkgdir"/usr/share/doc/${pkgname}/
	#cp -r "${srcdir}"zirkel/src/rene/zirkel/docs/* "$pkgdir"/usr/share/doc/${pkgname}/
}