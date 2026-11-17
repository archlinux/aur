# Maintainer: NSky Labs <nskysoft at gmail dot com>

pkgname=nsky-gdrive-sync
_name=gdrive-sync
pkgver=0.2.0
pkgrel=1
pkgdesc='Bidirectional Google Drive sync with real-time local file watching'
arch=('any')
url='https://github.com/NSky/gdrive-sync'
license=('MIT')
depends=('bash' 'rclone' 'inotify-tools' 'jq' 'systemd')
install=gdrive-sync.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1f80c14cf03d9646f16457d66b2a535fa77753d01a6fa8a4c90a1e917a8743e9')

check() {
  cd "$_name-$pkgver"
  make check
}

package() {
  cd "$_name-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr LICENSEDIR="/usr/share/licenses/$pkgname" install
}
