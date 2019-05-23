#Maintainer: Christoph Steinacker <archologist.linuxATgooglemailDOTcom>
#Maintainer: Heiko Nickerl <devATheiko-nickerlDOTcom>
pkgname=jes
pkgver=2.02.04
pkgrel=1
pkgdesc="A java-based tool for german cash method of accounting (Einnahmen-Überschuss-Rechnung)"
arch=('any')
url="http://www.jes-eur.de"
license=('custom')
#install="${pkgname}.install"
depends=('java-runtime' 'x-server' 'xdg-utils')
source=(http://www.jes-eur.de/userfiles/downloads/jes/jes_2.02.04.zip
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
sha512sums=('45fa8d11960bbf8bac80764832eedb528a66bcdc6543c896f6531397484bb771ef948c598d7641750b08bc65ab9fb06baa6debae0dd449c1902d0e75bfc38eb1'
            '4d8f6a3f220f922d33b8eced8be200681181746fb0841da98fc9f8d6162c43395054cd328099af9b26ff036b75a3dd00395824046d3b24ab41f7299e53dd99be'
            '869bb56593aeb13e804df88981c83af55f291d7f7531ec8cd1c4847a4fdbed52d4cc11ec7604c07a729504155f25a3f4741f16b444b8dd77249d42299e8bfec0'
            '7e5cb765fed87f9035bd81c238f3de87b82dfb52197528dd8b647c299cbc11ffe9c0b6fc69cee03a02a0e861dca016a45a2fe8b20c7668725c2009a0c461277f')
