#Maintainer: Christoph Steinacker <archologist.linuxATgooglemailDOTcom>
#Maintainer: Heiko Nickerl <devATheiko-nickerlDOTcom>
pkgname=jes
pkgver=2.01.25
pkgrel=1
pkgdesc="A java-based tool for german cash method of accounting (Einnahmen-Überschuss-Rechnung)"
arch=('any')
url="http://www.jes-eur.de"
license=('custom')
#install="${pkgname}.install"
depends=('java-runtime' 'x-server' 'xdg-utils')
source=(http://www.jes-eur.de/userfiles/downloads/jes/jes_2.01.25.zip
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
sha512sums=('49400ac23f0e1b167b13bc0f425179de7b72f16f596be93fe699be75d652f34ffe7970f41bdaa9414d49a980fe3183e571101b3f137c9485de4903f5cb20b3fa'
            '4d8f6a3f220f922d33b8eced8be200681181746fb0841da98fc9f8d6162c43395054cd328099af9b26ff036b75a3dd00395824046d3b24ab41f7299e53dd99be'
            '869bb56593aeb13e804df88981c83af55f291d7f7531ec8cd1c4847a4fdbed52d4cc11ec7604c07a729504155f25a3f4741f16b444b8dd77249d42299e8bfec0'
            '7e5cb765fed87f9035bd81c238f3de87b82dfb52197528dd8b647c299cbc11ffe9c0b6fc69cee03a02a0e861dca016a45a2fe8b20c7668725c2009a0c461277f')
