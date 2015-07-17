# Maintainer : André Fettouhi <a.fettouhi@gmail.com>

pkgname=gog-legend-of-grimrock
pkgver=1.1.0.4
pkgrel=1
pkgdesc="Explore a vast network of ancient tunnels, discover secrets, and find a way to survive in the perilous dungeons of Mount Grimrock."
arch=("i686" "x86_64")
url="http://www.gog.com/game/legend_of_grimrock"
license=("custom")
groups=("games")
source=("local://legend_of_grimrock_${pkgver}.tar.gz" "gog-legend-of-grimrock")
sha256sums=('bc5e387feb53629cbc5d8f889046dbf8e931d5b3958879171570f57f774168e6'
            'f5e9f95e55ab87c46033606c28cea3c76ff0a4367fa0dd671070b28a9be78130')
depends=(libgl libx11 libxext desktop-file-utils)
#options=('!strip')
PKGEXT=.pkg.tar

package() {
  mkdir -p "${pkgdir}"/opt/gog/legend-of-grimrock
  cp -r "${srcdir}"/Legend\ of\ Grimrock/* "${pkgdir}"/opt/gog/legend-of-grimrock
  install -Dm644 "${srcdir}"/Legend\ of\ Grimrock/support/gog-legend-of-grimrock-primary.desktop "${pkgdir}"/usr/share/applications/gog-legend-of-grimrock.desktop
  install -Dm644 "${srcdir}"/Legend\ of\ Grimrock/support/gog-legend-of-grimrock.png "${pkgdir}"/usr/share/pixmaps/gog-legend-of-grimrock.png
  install -Dm644 "${srcdir}"/Legend\ of\ Grimrock/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}/gog-legend-of-grimrock" "${pkgdir}/usr/bin/gog-legend-of-grimrock"
}
