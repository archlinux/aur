# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Arnaud Durand-Favreau <biginoz at FREE point FR>

pkgname=srtm2osm
pkgver=1.11.25.0
pkgrel=1
pkgdesc="Generates elevation contours (isohypses) of a selected terrain from Shuttle Radar Topography Mission (SRTM) digital elevation model (DEM)"
arch=('any')
url="http://wiki.openstreetmap.org/wiki/Srtm2osm"
license=('GPL')
depends=('mono')
source=(http://osm.michis-pla.net/code/Srtm2Osm-$pkgver.zip
        srtm2osm.sh)
sha256sums=('3c486c6ca3a369fbac2ccfe43735c135498afaec4d4c6b0fcb5379069bc3e650'
            '46b126b476a6b7624c4e4271a660dcede892cbcc6ea1e2a9c09eaf274cef0bb6')

package() {
  cd ${srcdir}/Srtm2Osm
 
  install -d ${pkgdir}/opt/srtm2osm
  cp * ${pkgdir}/opt/srtm2osm

  install -D -m755 ${srcdir}/srtm2osm.sh ${pkgdir}/usr/bin/srtm2osm
}
