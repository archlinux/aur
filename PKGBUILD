# $Id: PKGBUILD 71073 2012-05-23 06:56:29Z allan $
# Mantainer: Hector Mtz-Seara <hseara.at.gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Christian Storm <Christian.Storm@gmx.de>

pkgname=jabref
pkgver=2.10
pkgrel=2
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
sha1sums=('f6aec7909a5b53176a61fbe8a217543f496820f5'
         '3fcb4866699145cea609505c1563f181139fa4a2'
         '7e2be60888b79537863f6692b5d78b1f57ef9a9f')

package() {
  cd ${srcdir}
  install -Dm755 JabRef-${pkgver}.jar ${pkgdir}/usr/share/java/${pkgname}/JabRef-${pkgver}.jar

  install -Dm755 ${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
  sed -i "s/VERSION/${pkgver}/" ${pkgdir}/usr/bin/${pkgname}

  install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -Dm644 images/JabRef-icon-48.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
}
