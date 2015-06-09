# Maintainer : André Fettouhi <a.fettouhi@gmail.com>

pkgname=gog-beneath-a-steel-sky
pkgver=1.0.0.2
pkgrel=1
pkgdesc="All man's social problems are coming to a boil. Under the claustrophobic lid of a steel sky. "
arch=("i686" "x86_64")
url="http://www.gog.com/game/beneath_a_steel_sky"
license=("custom")
groups=("games")
source=("local://gog_beneath_a_steel_sky_${pkgver}.tar.gz" "gog-beneath-a-steel-sky")
sha256sums=('bc309545a368e94abeb48a58d322f2ae578d23943dd027e90dd5057b32af317f'
            '71c9b6d850c92c637cd44a502de8db01498e88af9829125f7fb9097b4575d60b')
depends=(freetype2 unionfs-fuse)
#options=('!strip')
PKGEXT=.pkg.tar

package() {
  mkdir -p "${pkgdir}"/opt/gog/beneath-a-steel-sky
  cp -r "${srcdir}"/Beneath\ A\ Steel\ Sky/* "${pkgdir}"/opt/gog/beneath-a-steel-sky
  install -Dm644 "${srcdir}"/Beneath\ A\ Steel\ Sky/support/gog-beneath-a-steel-sky-primary.desktop "${pkgdir}"/usr/share/applications/gog-beneath-a-steel-sky.desktop
  install -Dm644 "${srcdir}"/Beneath\ A\ Steel\ Sky/support/gog-beneath-a-steel-sky.png "${pkgdir}"/usr/share/pixmaps/gog-beneath-a-steel-sky.png
  install -Dm644 "${srcdir}"/Beneath\ A\ Steel\ Sky/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}/gog-beneath-a-steel-sky" "${pkgdir}/usr/bin/gog-beneath-a-steel-sky"
}
