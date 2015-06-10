# Maintainer : André Fettouhi <a.fettouhi@gmail.com>

pkgname=gog-duke-nukem-3d
pkgver=1.0.0.7
pkgrel=1
pkgdesc="This sci-fi scrolling shooter brings you some of the most intense action ever seen on the PC."
arch=("i686" "x86_64")
url="http://www.gog.com/game/duke_nukem_3d_atomic_edition"
license=("custom")
groups=("games")
source=("local://gog_duke_nukem_3d_${pkgver}.tar.gz" "gog-duke-nukem-3d")
sha256sums=('ba81c81d5f35f3aa424d30d9ab1c8441f8967bf4776cc85299efc95eea257ea3'
            '84703ccf958c6bcc41ffac6d5c2ed9b86a2ceffb845e232c869acfe953f50f9d')
depends=(libpng12 unionfs-fuse)
#options=('!strip')
PKGEXT=.pkg.tar 

package() {
  mkdir -p "${pkgdir}"/opt/gog/duke-nukem-3d
  cp -r "${srcdir}"/Duke\ Nukem\ 3D/* "${pkgdir}"/opt/gog/duke-nukem-3d
  install -Dm644 "${srcdir}"/Duke\ Nukem\ 3D/support/gog-duke-nukem-3d-primary.desktop "${pkgdir}"/usr/share/applications/gog-duke-nukem-3d.desktop
  install -Dm644 "${srcdir}"/Duke\ Nukem\ 3D/support/gog-duke-nukem-3d-1.desktop "${pkgdir}"/usr/share/applications/gog-duke-nukem-3d-server.desktop
  install -Dm644 "${srcdir}"/Duke\ Nukem\ 3D/support/gog-duke-nukem-3d-2.desktop "${pkgdir}"/usr/share/applications/gog-duke-nukem-3d-client.desktop
  install -Dm644 "${srcdir}"/Duke\ Nukem\ 3D/support/gog-duke-nukem-3d.png "${pkgdir}"/usr/share/pixmaps/gog-duke-nukem-3d.png
  install -Dm644 "${srcdir}"/Duke\ Nukem\ 3D/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}/gog-duke-nukem-3d" "${pkgdir}/usr/bin/gog-duke-nukem-3d"
} 
