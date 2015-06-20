# Maintainer : JoJos

pkgname=gog-deponia
pkgver=1.0.0.1
pkgrel=1
pkgdesc="Rufus is not a pleasant guy. Ill-tempered and entirely too convinced of his own greatness, he lives at the edge of a small settlement somewhere in the most remote sector of the garbage-covered planet Deponia. GOG linux game package required!"
arch=("i686" "x86_64")
url="http://www.gog.com/game/deponia"
license=("custom")
groups=("games")
source=("local://gog_deponia_${pkgver}.tar.gz" "gog-deponia")
md5sums=('eecdcdceef7baf7095a2c0737dc6dd56'
         'df28238a567d876ba67383efb7754fe5')
depends=(libgl libx11 libxext desktop-file-utils)
#options=('!strip')
PKGEXT=.pkg.tar

package() {
  mkdir -p "${pkgdir}"/opt/gog/deponia
  cp -r "${srcdir}"/Deponia/* "${pkgdir}"/opt/gog/deponia
  install -Dm644 "${srcdir}"/Deponia/support/gog-deponia-primary.desktop "${pkgdir}"/usr/share/applications/gog-deponia.desktop
  install -Dm644 "${srcdir}"/Deponia/support/gog-deponia.png "${pkgdir}"/usr/share/pixmaps/gog-deponia.png
  install -Dm644 "${srcdir}"/Deponia/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}/gog-deponia" "${pkgdir}/usr/bin/gog-deponia"
}
