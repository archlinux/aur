# Maintainer: Christoph Steinacker <archologist.linuxATgooglemailDOTcom>
pkgname=jes
pkgver=1.00.40
pkgrel=1
pkgdesc="A java-based tool for german cash method of accounting (Einnahme-Überschuss-Rechnung)"
arch=('any')
url="http://www.jes-eur.de"
license=('custom')
#install="${pkgname}.install"
depends=('java-runtime' 'x-server' 'xdg-utils')
source=(https://dl.dropboxusercontent.com/u/2628626/jes/jes_10040.zip
        ${pkgname}.desktop
	${pkgname}.sh.new
	LICENSE
)
package() {
  # Removing delivered shell script
  rm $srcdir/$pkgname.sh

  cd ${srcdir}
  install -D -m755 jes.jar ${pkgdir}/usr/share/java/${pkgname}/jes.jar

  install -D -m755 ${pkgname}.sh.new ${pkgdir}/usr/bin/${pkgname}
  install -D -m644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop

  # Installing the LICENSE
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  # Installing the icons
  install -D -m644 ${pkgname}.png ${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png
}
md5sums=('a98fe3051629d982fefdc752a4fd9b2d'
	 'fb13c662b57cf5a59ba54004de735b82'
	 '611c2047318cbad2e5ae2f186f26593d'
   '7d5b1e5c39c18e5f943bb35f6bccd62a')