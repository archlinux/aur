# Maintainer : André Fettouhi <a.fettouhi@gmail.com>

pkgname=gog-baldurs-gate
pkgver=1.0.0.8
pkgrel=1
pkgdesc="Chaos threatens to overwhelm the Sword Coast."
arch=("i686" "x86_64")
url="http://www.gog.com/game/baldurs_gate_the_original_saga"
license=("custom")
groups=("games")
source=("local://gog_baldurs_gate_${pkgver}.tar.gz" "gog-baldurs-gate" "gog-bg-config" "gog-bg-config.desktop")
sha256sums=('c2db4fc324c9f501d6699c48ca46d7be91ac9f3700b25a9f45ccbe1c4b36795d'
            '753996deb01ee6c31fbbe5aa026b468e234651ec44d402d176f8cc62e55841a3'
            '0b4dfa795a861fc605d7d42f059739910b92380d461d8bb2526bf93fcb1917a6'
            '392dd0c30932a517aa7b47c7b057a15b291ce4b235c6a18d786b69dc51e8f420')
depends=(freetype2 wine)
#options=('!strip')
PKGEXT=.pkg.tar

package() {
  mkdir -p "${pkgdir}"/opt/gog/baldurs-gate
  cp -r "${srcdir}"/Baldurs\ Gate/prefix/drive_c/GOG\ Games/Baldur\'s\ Gate/* "${pkgdir}"/opt/gog/baldurs-gate
  sed -i s/'HD0:=.\+'/'HD0:=C:\\baldurs-gate\\'/ "${pkgdir}"/opt/gog/baldurs-gate/Baldur.ini
  sed -i s/'CD1:=.\+'/'CD1:=C:\\baldurs-gate\\'/ "${pkgdir}"/opt/gog/baldurs-gate/Baldur.ini
  sed -i s/'CD2:=.\+'/'CD2:=C:\\baldurs-gate\\'/ "${pkgdir}"/opt/gog/baldurs-gate/Baldur.ini
  sed -i s/'CD3:=.\+'/'CD3:=C:\\baldurs-gate\\'/ "${pkgdir}"/opt/gog/baldurs-gate/Baldur.ini
  sed -i s/'CD4:=.\+'/'CD4:=C:\\baldurs-gate\\'/ "${pkgdir}"/opt/gog/baldurs-gate/Baldur.ini
  sed -i s/'CD5:=.\+'/'CD5:=C:\\baldurs-gate\\'/ "${pkgdir}"/opt/gog/baldurs-gate/Baldur.ini
  sed -i s/'CD6:=.\+'/'CD6:=C:\\baldurs-gate\\'/ "${pkgdir}"/opt/gog/baldurs-gate/Baldur.ini 
  install -Dm644 "${srcdir}"/Baldurs\ Gate/support/gog-baldurs-gate-primary.desktop "${pkgdir}"/usr/share/applications/gog-baldurs-gate.desktop
  install -Dm644 "${srcdir}"/gog-bg-config.desktop "${pkgdir}"/usr/share/applications/gog-bg-config.desktop
  install -Dm644 "${srcdir}"/Baldurs\ Gate/support/gog-baldurs-gate.png "${pkgdir}"/usr/share/pixmaps/gog-baldurs-gate.png
  install -Dm644 "${srcdir}"/Baldurs\ Gate/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}/gog-baldurs-gate" "${pkgdir}/usr/bin/gog-baldurs-gate"
  install -Dm755 "${srcdir}/gog-bg-config" "${pkgdir}/usr/bin/gog-bg-config"
} 
