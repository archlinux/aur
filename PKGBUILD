#Maintainer: Christoph Steinacker <archologist.linuxATgooglemailDOTcom>
#Maintainer: Heiko Nickerl <devATheiko-nickerlDOTcom>
pkgname=jes
pkgver=2.04.16
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
sha512sums=('c576fae1980cce56f81d77201577de610519dede97974b727cdf89270babcc93383e569d7427c9e64555fa9d97b1df5e37176dd0ad7639b4c8098ffb26b2462e'
            '8ebf48266ba3f55369fb01d9c465fa6c8c30a13c5ca8d1936bf2a3654c659f59b6c47c250e3e7b7e944c9c1cdcc858a085beeb185b1c892fddadbfa23a8f1ce9'
            '869bb56593aeb13e804df88981c83af55f291d7f7531ec8cd1c4847a4fdbed52d4cc11ec7604c07a729504155f25a3f4741f16b444b8dd77249d42299e8bfec0'
            '7e5cb765fed87f9035bd81c238f3de87b82dfb52197528dd8b647c299cbc11ffe9c0b6fc69cee03a02a0e861dca016a45a2fe8b20c7668725c2009a0c461277f')
