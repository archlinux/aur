# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname=plasma6-applets-mawaqit-prayer-times
pkgver=0.7.2
pkgrel=1
pkgdesc="Plasma 6 widget showing prayer times from your mosque on mawaqit.net"
arch=('any')
url='https://github.com/medaminezghal/plasma6-applets-mawaqit-prayer-times'
license=('GPL-3.0-or-later')
depends=('plasma-workspace')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('93a5b3b7729289e6b1385592d234cf655adb37c1271363e3ddefdd2fe9f149d5')

package() {
  cd "$pkgname-$pkgver"
  install -dm755 "$pkgdir"/usr/share/plasma/plasmoids
  cp -r package "$pkgdir"/usr/share/plasma/plasmoids/com.github.medaminezghal.mawaqit
  install -Dm644 package/contents/icons/mosque.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/com.github.medaminezghal.mawaqit.svg
  find "$pkgdir"/usr/share/plasma/plasmoids -type d -exec chmod 755 {} +
  find "$pkgdir"/usr/share/plasma/plasmoids -type f -exec chmod 644 {} +
}
