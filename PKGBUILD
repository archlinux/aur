# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Arnaud Durand-Favreau <biginoz at FREE point FR>

pkgname=srtm2osm
pkgver=1.12.1.0
pkgrel=1
pkgdesc="Generates elevation contours (isohypses) of a selected terrain from Shuttle Radar Topography Mission (SRTM) digital elevation model (DEM)"
arch=('any')
url="http://wiki.openstreetmap.org/wiki/Srtm2osm"
license=('GPL')
depends=('mono')
source=(http://osm.michis-pla.net/code/Srtm2Osm-$pkgver.zip
        srtm2osm.sh)
sha256sums=('0ec9e006d5b1aad80cf030e2961d05d8d39235503420ac8b9499cea2edb84e24'
            '46b126b476a6b7624c4e4271a660dcede892cbcc6ea1e2a9c09eaf274cef0bb6')

package() {
  cd "${srcdir}"/Srtm2Osm

  install -d "${pkgdir}"/opt/srtm2osm
  cp * "${pkgdir}"/opt/srtm2osm

  install -Dm755 "${srcdir}"/srtm2osm.sh "${pkgdir}"/usr/bin/srtm2osm
}
