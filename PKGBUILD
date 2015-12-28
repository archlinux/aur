# $Id: PKGBUILD 71073 2012-05-23 06:56:29Z allan $
# Mantainer: Hector Mtz-Seara <hseara.at.gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Christian Storm <Christian.Storm@gmx.de>

pkgname=jabref
pkgver=3.1
pkgrel=1
pkgdesc="GUI frontend for BibTeX, written in Java"
arch=('any')
url="http://jabref.sourceforge.net/"
license=('GPL')
depends=('java-runtime>=8')
optdepends=(
   'gsettings-desktop-schemas: For web search support'
)
source=(http://downloads.sourceforge.net/$pkgname/JabRef-${pkgver}.jar
        jabref.sh
        jabref.desktop)
sha256sums=('81adaa1b672535e7b64814b6ad8f6a00e8bcf0a82b0849ba4523e36cd440425d'
            '05b4ff3d9323a16d5e10b9d5266466573ee9a56e985c1e0896a68ea177e0c1d0'
            'f958793f6e408bab7db84973169b30ed61077112d3f552dbcc9f068847317602')

package() {
  cd ${srcdir}
  install -Dm755 JabRef-${pkgver}.jar ${pkgdir}/usr/share/java/${pkgname}/JabRef-${pkgver}.jar

  install -Dm755 ${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
  sed -i "s/VERSION/${pkgver}/" ${pkgdir}/usr/bin/${pkgname}

  install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -Dm644 images/icons/JabRef-icon-48.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
}
