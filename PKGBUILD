# Contributor: Philipp Schwarz <fidschi_aur@temporaryforwarding.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Dany Martineau <dany.luc.martineau at gmail.com>
# Contributor: moostik <mooostik_at_gmail.com>

pkgname=car
pkgver=2015.08.10
pkgrel=2
url="http://car.rene-grothmann.de/"
pkgdesc="Circle and Ruler is a dynamic geometry program"
arch=('any')
license=('GPL')
depends=('java-runtime' 'xdg-utils')
source=("http://car.rene-grothmann.de/download/zirkel.zip"
        "${pkgname}.desktop"
	"${pkgname}.sh")
md5sums=('a15c1a69e325374af71e94b4302e74d2'
         '9bf9a70cf538378bde46f3da2c252a4c'
         '2539542867d5f23e823b7a7704f17443')

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
