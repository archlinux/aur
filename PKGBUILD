# Maintainer : André Fettouhi <a.fettouhi@gmail.com>

pkgname=gog-dragonsphere
pkgver=1.0.0.1
pkgrel=1
pkgdesc="A challenging adventure game that will captivate with clever puzzles and thrilling environments."
arch=("i686" "x86_64")
url="http://www.gog.com/game/dragonsphere"
license=("custom")
groups=("games")
source=("local://dragonsphere_${pkgver}.tar.gz" "gog-dragonsphere")
sha256sums=('27906a6c46b0c4d2b8830f5e363a4c4cf40121ab8f8c0caba81fa83323b6dc03'
            '1cb7c00e7bebc3a44ce1e7cce224acc8bda6b6668792bb95b84a2d1a71df8400')
depends=(libpng12 unionfs-fuse)
#options=('!strip')
PKGEXT=.pkg.tar 

package() {
  mkdir -p "${pkgdir}"/opt/gog/dragonsphere
  cp -r "${srcdir}"/Dragonsphere/* "${pkgdir}"/opt/gog/dragonsphere
  install -Dm644 "${srcdir}"/Dragonsphere/support/gog-dragonsphere-primary.desktop "${pkgdir}"/usr/share/applications/gog-dragonsphere.desktop
  install -Dm644 "${srcdir}"/Dragonsphere/support/gog-dragonsphere.png "${pkgdir}"/usr/share/pixmaps/gog-dragonsphere.png
  install -Dm644 "${srcdir}"/Dragonsphere/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}/gog-dragonsphere" "${pkgdir}/usr/bin/gog-dragonsphere"
} 
