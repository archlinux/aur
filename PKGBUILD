# Maintainer : Suntorvic <suntorvic at free dot fr>

pkgname=gog-towerfall-ascension
pkgver=1.1.0.3
pkgrel=2
pkgdesc="Inspired by classics from the golden age of couch multiplayer, TowerFall Ascension is a 4-player local party game centering around hilarious, intense versus matches. GOG linux game package required"
pkbase=gog-towerfall-ascension
arch=("i686" "x86_64")
url="http://www.gog.com/game/towerfall_ascension"
license=("custom")
groups=("games")
source=("local://gog_towerfall_ascension_${pkgver}.tar.gz" 
"gog-towerfall-ascension")
sha256sums=('c58de25fe1c3538772195ebb51dbd39f738d33843c49b53c0cf66bc599dc02bb'
            '4cf09cb573a0b25897b80a223892783301f271a4741c51a16c029a50df1117d3')
depends=(gcc-libs)
#options=('!strip')
PKGEXT=.pkg.tar

package() {
  mkdir -p "${pkgdir}"/opt/gog/towerfall-ascension
  cp -r "${srcdir}"/TowerFall\ Ascension/* "${pkgdir}"/opt/gog/towerfall-ascension
  install -Dm644 "${srcdir}"/TowerFall\ Ascension/support/gog-towerfall-ascension-primary.desktop "${pkgdir}"/usr/share/applications/gog-towerfall-ascension.desktop
  install -Dm644 "${srcdir}"/TowerFall\ Ascension/support/gog-towerfall-ascension.png "${pkgdir}"/usr/share/pixmaps/gog-towerfall-ascension.png
  install -Dm644 "${srcdir}"/TowerFall\ Ascension/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}/gog-towerfall-ascension" "${pkgdir}/usr/bin/gog-towerfall-ascension"
} 