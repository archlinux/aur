# $Id: PKGBUILD 71073 2012-05-23 06:56:29Z allan $
# Mantainer: Hector Mtz-Seara <hseara.at.gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Christian Storm <Christian.Storm@gmx.de>

pkgname=jabref
pkgver=3.0
pkgrel=1
pkgdesc="GUI frontend for BibTeX, written in Java"
arch=('any')
url="http://jabref.sourceforge.net/"
license=('GPL')
depends=('java-runtime')
optdepends=(
   'gsettings-desktop-schemas: For web search support'
)
source=(http://downloads.sourceforge.net/$pkgname/JabRef-${pkgver}.jar
        jabref.sh
        jabref.desktop)
sha256sums=('aa0d202319cf99c509313d59c342a32cb323895d167d4a49011ad8c2593adc1e'
            '05b4ff3d9323a16d5e10b9d5266466573ee9a56e985c1e0896a68ea177e0c1d0'
            '9102977f437aad1fe4e8907331a0fc52c9c7d75328b3fde6163aa4eca93b00ca')

package() {
  cd ${srcdir}
  install -Dm755 JabRef-${pkgver}.jar ${pkgdir}/usr/share/java/${pkgname}/JabRef-${pkgver}.jar

  install -Dm755 ${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
  sed -i "s/VERSION/${pkgver}/" ${pkgdir}/usr/bin/${pkgname}

  install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -Dm644 images/icons/JabRef-icon-48.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
}
