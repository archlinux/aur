# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname=plasma6-applets-mawaqit-prayer-times
pkgver=0.5.0
pkgrel=1
pkgdesc="Plasma 6 widget showing prayer times from your mosque on mawaqit.net"
arch=('any')
url='https://github.com/medaminezghal/plasma6-applets-mawaqit-prayer-times'
license=('GPL-3.0-or-later')
depends=('plasma-workspace')
optdepends=('qt6-positioning: GPS-accurate location detection via GeoClue' 'geoclue: location service backend for qt6-positioning')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3b625f3d8b78a7b83c96e8ce861e17333eacaedd8ada8369e51a7176c0d50d40')

package() {
  cd "$srcdir"/$pkgname-$pkgver
  install -dm755 "$pkgdir/usr/share/plasma/plasmoids"
  cp -r package \
    "$pkgdir/usr/share/plasma/plasmoids/com.github.medaminezghal.mawaqit"

  install -Dm644 package/contents/icons/mosque.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.github.medaminezghal.mawaqit.svg"

  find "$pkgdir/usr/share/plasma/plasmoids" -type d -exec chmod 755 {} +
  find "$pkgdir/usr/share/plasma/plasmoids" -type f -exec chmod 644 {} +
}
