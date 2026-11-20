# DO NOT EDIT DIRECTLY: Managed by scripts/sync_metadata.go from app.config.json
# Maintainer: Alexander Mot <alexander@amot.dev>
pkgname=planisphere-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Elite Dangerous Expedition Planner and Astrometric Telemetry Terminal"
arch=('x86_64')
url="https://github.com/amot-dev/planisphere"
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$url/releases/download/v$pkgver/planisphere-v$pkgver-linux-amd64.tar.gz")
sha256sums=('b8ab12169867d6a041cd1d365c1eb85406099d5ad8eee1fe253d83b141c4a830')

package() {
  cd "$srcdir"
  install -Dm755 planisphere "$pkgdir/usr/bin/planisphere"
  install -Dm644 planisphere.desktop "$pkgdir/usr/share/applications/planisphere.desktop"
  install -Dm644 planisphere.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/planisphere.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
