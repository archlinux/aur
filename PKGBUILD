# Maintainer : JoJos

pkgname=gog-deponia-2-chaos-on-deponia
pkgver=1.0.0.1
pkgrel=1
pkgdesc="Rufus is not a pleasant guy. Ill-tempered and entirely too convinced of his own greatness, he lives at the edge of a small settlement somewhere in the most remote sector of the garbage-covered planet Deponia. GOG linux game package required!"
arch=("i686" "x86_64")
url="http://www.gog.com/game/deponia_2_chaos_on_deponia"
license=("custom")
groups=("games")
source=("local://gog_deponia_2_chaos_on_deponia_${pkgver}.tar.gz" "gog-deponia-2-chaos-on-deponia")
md5sums=('c231dd926257bc2cf9849d82e711e808'
         '2b15664c975ed0f2b7a1142700627274')
depends=(libgl libx11 libxext desktop-file-utils)
#options=('!strip')
PKGEXT=.pkg.tar

package() {
  mkdir -p "${pkgdir}"/opt/gog/deponia-2-chaos-on-deponia
  cp -r "${srcdir}"/Deponia\ 2\ -\ Chaos\ on\ Deponia/* "${pkgdir}"/opt/gog/deponia-2-chaos-on-deponia
  install -Dm644 "${srcdir}"/Deponia\ 2\ -\ Chaos\ on\ Deponia/support/gog-deponia-2-chaos-on-deponia-primary.desktop "${pkgdir}"/usr/share/applications/gog-deponia-2-chaos-on-deponia.desktop
  install -Dm644 "${srcdir}"/Deponia\ 2\ -\ Chaos\ on\ Deponia/support/gog-deponia-2-chaos-on-deponia.png "${pkgdir}"/usr/share/pixmaps/gog-deponia-2-chaos-on-deponia.png
  install -Dm644 "${srcdir}"/Deponia\ 2\ -\ Chaos\ on\ Deponia/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}/gog-deponia-2-chaos-on-deponia" "${pkgdir}/usr/bin/gog-deponia-2-chaos-on-deponia"
}
