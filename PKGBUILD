# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Arnaud Durand-Favreau <biginoz at FREE point FR>

pkgname=srtm2osm
pkgver=1.13.1.0
pkgrel=2
pkgdesc="Generates elevation contours (isohypses) of a selected terrain from Shuttle Radar Topography Mission (SRTM) digital elevation model (DEM)"
arch=('any')
url="http://wiki.openstreetmap.org/wiki/Srtm2osm"
license=('GPL')
depends=('mono')
source=(http://osm.michis-pla.net/code/Srtm2Osm-$pkgver.zip{,.sig}
        srtm2osm.sh)
validpgpkeys=('59605602251E698FDF9F2B002A6937A4B943615E') #Michael Bemmerl <mail@mx-server.de>
sha256sums=('75fd564d681a40b28e40f4203c1fe81fd953a6de42e686711f6ccea6c2e1aaf2'
            'SKIP'
            '82df2c9678b4798a269e99f4d6449703b9e8a31e6919a9eba9abbd7cf0b238a8')

package() {
  cd "${srcdir}"/Srtm2Osm

  install -d "${pkgdir}"/opt/srtm2osm
  cp * "${pkgdir}"/opt/srtm2osm

  install -Dm755 "${srcdir}"/srtm2osm.sh "${pkgdir}"/usr/bin/srtm2osm
}
