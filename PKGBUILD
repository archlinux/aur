# Contributor: Philipp Schwarz <fidschi_aur@temporaryforwarding.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Dany Martineau <dany.luc.martineau at gmail.com>
# Contributor: moostik <mooostik_at_gmail.com>
# Maintainer: Michael Kogan <michael.kogan at gmx.net>

pkgname=car
pkgver=2023.03
major=$(echo $pkgver | cut -d. -f1)
minor=$(echo $pkgver | cut -d. -f2)
pkgrel=2
url="http://car.rene-grothmann.de/"
pkgdesc="Compass and Ruler is a dynamic geometry program"
arch=('any')
license=('GPL')
depends=('java-runtime' 'xdg-utils')
source=("https://sourceforge.net/projects/zirkel/files/Version%20${major}-${minor}/car_${major}-${minor}.zip/download"
        "${pkgname}.desktop"
	"${pkgname}.sh")
md5sums=('b1f41add39f6464f88892a0bda0898d2'
         '94fdcd79f877188507c68434c2a80e67'
         'fbed86abe156c2091ea42ef989204bb3')

package() {
        cd "${srcdir}/car"
	install -Dm644 "${srcdir}/car/doc_en/zirkel.jar" \
	  "${pkgdir}/usr/share/java/car/zirkel.jar"
	install -d "${pkgdir}/usr/share/pixmaps"
	install -Dm644 "${srcdir}/car/doc_en/images/ZuL-Logo.png" \
	  "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${srcdir}/${pkgname}.desktop" \
	  "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -d "$pkgdir"/usr/share/doc/${pkgname}/
	cp -r "${srcdir}"/car/doc_en/* "$pkgdir"/usr/share/doc/${pkgname}/
}