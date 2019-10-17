#Maintainer: Christoph Steinacker <archologist.linuxATgooglemailDOTcom>
#Maintainer: Heiko Nickerl <devATheiko-nickerlDOTcom>
pkgname=jes
pkgver=2.02.25
pkgrel=1
pkgdesc="A java-based tool for german cash method of accounting (Einnahmen-Überschuss-Rechnung)"
arch=('any')
url="http://www.jes-eur.de"
license=('custom')
#install="${pkgname}.install"
depends=('java-runtime' 'x-server' 'xdg-utils')
source=(http://www.jes-eur.de/userfiles/downloads/jes/jes_${pkgver}.zip
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
sha512sums=('5c69844236754faca15b0e7fddff12390f889a213a780f24bf14e39af2799bf43eb0e7bd2930858c88d6516a9860255407a4552c931f49c9745329806ad2557a'
            '8ebf48266ba3f55369fb01d9c465fa6c8c30a13c5ca8d1936bf2a3654c659f59b6c47c250e3e7b7e944c9c1cdcc858a085beeb185b1c892fddadbfa23a8f1ce9'
            '869bb56593aeb13e804df88981c83af55f291d7f7531ec8cd1c4847a4fdbed52d4cc11ec7604c07a729504155f25a3f4741f16b444b8dd77249d42299e8bfec0'
            '7e5cb765fed87f9035bd81c238f3de87b82dfb52197528dd8b647c299cbc11ffe9c0b6fc69cee03a02a0e861dca016a45a2fe8b20c7668725c2009a0c461277f')
