# Maintainer : André Fettouhi <a.fettouhi@gmail.com>

pkgname=gog-baldurs-gate-2
pkgver=1.0.0.5
pkgrel=1
pkgdesc="Your story begins anew in the exotic southern kingdom of Amn, amidst the opulence of the sinister capital city of Athkatla."
arch=("i686" "x86_64")
url="http://www.gog.com/game/baldurs_gate_2_complete"
license=("custom")
groups=("games")
source=("local://gog_baldurs_gate_2_${pkgver}.tar.gz" "gog-baldurs-gate-2" "gog-bg2-config" "gog-bg2-config.desktop")
sha256sums=('222991318bcafbb52ffb603b5cb1a9f5792799598b69ebc8eca410fc61a73b2d'
            'b2b55f1b4ef90e182950e3a4a6be68b4b37ba43abb8a33b68ed84a86a31680d2'
            'af301428e61b72eacc636254c1b2fdc82cdf4e3bf7800e8846e3f9437e18538b'
            'efad7d64aae57ceddbe378dcf04d535425a9ce6a438b43799f389121ec9a0b3f')
depends=(freetype2 wine)
#options=('!strip')
PKGEXT=.pkg.tar

package() {
  mkdir -p "${pkgdir}"/opt/gog/baldurs-gate-2
  cp -r "${srcdir}"/Baldurs\ Gate\ 2/prefix/drive_c/GOG\ Games/Baldur\'s\ Gate\ 2/* "${pkgdir}"/opt/gog/baldurs-gate-2
  sed -i s/'HD0:=.\+'/'HD0:=C:\\baldurs-gate-2\\'/ "${pkgdir}"/opt/gog/baldurs-gate-2/baldur.ini
  sed -i s/'CD1:=.\+'/'CD1:=C:\\baldurs-gate-2\\data\\'/ "${pkgdir}"/opt/gog/baldurs-gate-2/baldur.ini
  sed -i s/'CD2:=.\+'/'CD2:=C:\\baldurs-gate-2\\data\\'/ "${pkgdir}"/opt/gog/baldurs-gate-2/baldur.ini
  sed -i s/'CD3:=.\+'/'CD3:=C:\\baldurs-gate-2\\data\\'/ "${pkgdir}"/opt/gog/baldurs-gate-2/baldur.ini
  sed -i s/'CD4:=.\+'/'CD4:=C:\\baldurs-gate-2\\data\\'/ "${pkgdir}"/opt/gog/baldurs-gate-2/baldur.ini
  sed -i s/'CD5:=.\+'/'CD5:=C:\\baldurs-gate-2\\data\\'/ "${pkgdir}"/opt/gog/baldurs-gate-2/baldur.ini
  sed -i s/'CD6:=.\+'/'CD6:=C:\\baldurs-gate-2\\data\\'/ "${pkgdir}"/opt/gog/baldurs-gate-2/baldur.ini 
  install -Dm644 "${srcdir}"/Baldurs\ Gate\ 2/support/gog-baldurs-gate-2-primary.desktop "${pkgdir}"/usr/share/applications/gog-baldurs-gate-2.desktop
  install -Dm644 "${srcdir}"/gog-bg2-config.desktop "${pkgdir}"/usr/share/applications/gog-bg2-config.desktop
  install -Dm644 "${srcdir}"/Baldurs\ Gate\ 2/support/gog-baldurs-gate-2.png "${pkgdir}"/usr/share/pixmaps/gog-baldurs-gate-2.png
  install -Dm644 "${srcdir}"/Baldurs\ Gate\ 2/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}/gog-baldurs-gate-2" "${pkgdir}/usr/bin/gog-baldurs-gate-2"
  install -Dm755 "${srcdir}/gog-bg2-config" "${pkgdir}/usr/bin/gog-bg2-config"
} 
