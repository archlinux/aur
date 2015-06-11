# Maintainer : André Fettouhi <a.fettouhi@gmail.com>

pkgname=gog-sam-and-max-hit-the-road
pkgver=1.0.0.6
pkgrel=1
pkgdesc="Grab your nightstick, squeal like a siren, and Hit the Road with Sam & Max, Freelance Police, as they attempt to crack their toughest case."
arch=("i686" "x86_64")
url="http://www.gog.com/game/sam_max_hit_the_road"
license=("custom")
groups=("games")
source=("local://gog_sam_and_max_hit_the_road_${pkgver}.deb" "gog-sam-and-max-hit-the-road")
sha256sums=('588819de0a6c28387a374ffb01520a7ceb1096a5590d31707d9ae790fab33c7c'
            '73a3d1b794f0f95b43e32aeb7cd9d9ab33d09ee44ada315ef1b100986016382a')
depends=(freetype2 unionfs-fuse)
#options=('!strip')
PKGEXT=.pkg.tar

package() {
  ar p gog_sam_and_max_hit_the_road_${pkgver}.deb data.tar.xz | tar -xJf -
  mkdir -p "${pkgdir}"/opt/gog/sam-and-max-hit-the-road
  cp -r "${srcdir}"/opt/GOG\ Games/Sam\ And\ Max\ Hit\ The\ Road/* "${pkgdir}"/opt/gog/sam-and-max-hit-the-road
  install -Dm644 "${srcdir}"/opt/GOG\ Games/Sam\ And\ Max\ Hit\ The\ Road/support/gog-sam-and-max-hit-the-road-primary.desktop "${pkgdir}"/usr/share/applications/gog-sam-and-max-hit-the-road.desktop
  install -Dm644 "${srcdir}"/opt/GOG\ Games/Sam\ And\ Max\ Hit\ The\ Road/support/gog-sam-and-max-hit-the-road.png "${pkgdir}"/usr/share/pixmaps/gog-sam-and-max-hit-the-road.png
  install -Dm644 "${srcdir}"/opt/GOG\ Games/Sam\ And\ Max\ Hit\ The\ Road/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}/gog-sam-and-max-hit-the-road" "${pkgdir}/usr/bin/gog-sam-and-max-hit-the-road"
}
