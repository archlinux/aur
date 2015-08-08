# Maintainer: Jeff Youdontneedtoknow <jeffpublicjr at gmail dot com>

pkgname=gog-flatout-2
pkgver=1.0.0.3
pkgrel=2
pkgdesc="Experience the drive of your life as you throw yourself around on and off the track!"
arch=("i686" "x86_64")
url="http://www.gog.com/game/flatout_2"
license=("custom")
groups=("games")
source=("local://gog_flatout_2_${pkgver}.tar.gz" "gog-flatout-2")
sha256sums=('ca8694c3e1ff6223b5100757b3ee6da0591ae826369c64f2ce426fa011d63334'
            '53eb5660e121fa7346d0a48e85b14f7801012140bd415b04c47f511253aa79e7')
depends=(libgl libx11 libxext desktop-file-utils)
PKGEXT=.pkg.tar

package() {
  mkdir -p "${pkgdir}"/usr/share/gog/flatout_2
  cp -r "${srcdir}"/FlatOut\ 2/* "${pkgdir}"/usr/share/gog/flatout_2
  install -Dm644 "${srcdir}"/FlatOut\ 2/support/gog-flatout-2-primary.desktop "${pkgdir}"/usr/share/applications/gog-flatout-2.desktop
  install -Dm644 "${srcdir}"/FlatOut\ 2/support/gog-flatout-2.png "${pkgdir}"/usr/share/pixmaps/gog-flatout-2.png
  install -Dm644 "${srcdir}"/FlatOut\ 2/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}/gog-flatout-2" "${pkgdir}/usr/bin/gog-flatout-2"
}
