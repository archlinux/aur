# DO NOT EDIT DIRECTLY: Managed by scripts/sync_metadata.go from app.config.json
# Maintainer: Alexander Mot <alexander@amot.dev>
pkgname=planisphere-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Elite Dangerous Expedition Planner and Astrometric Telemetry Terminal"
arch=('x86_64')
url="https://github.com/amot-dev/planisphere"
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$url/releases/download/v$pkgver/planisphere-v$pkgver-linux-amd64.tar.gz")
sha256sums=('c065d3fba071dadef57f4381c6f05e53f532e0dcb131e8031909d1cea8dd4244')

package() {
  cd "$srcdir"
  install -Dm755 planisphere "$pkgdir/usr/bin/planisphere"
  install -Dm644 planisphere.desktop "$pkgdir/usr/share/applications/planisphere.desktop"
  install -Dm644 planisphere.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/planisphere.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
