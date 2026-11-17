# Maintainer: NSky Labs <nskysoft at gmail dot com>

pkgname=nsky-gdrive-sync
_name=gdrive-sync
pkgver=0.2.1
pkgrel=1
pkgdesc='Bidirectional Google Drive sync with real-time local file watching'
arch=('any')
url='https://github.com/NSky/gdrive-sync'
license=('MIT')
depends=('bash' 'rclone' 'inotify-tools' 'jq' 'systemd')
install=gdrive-sync.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c69124c6f2dc0d5dd0d5c24ed2a843665f7a19729635cb2de1ee09e0a44623c6')

check() {
  cd "$_name-$pkgver"
  make check
}

package() {
  cd "$_name-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr LICENSEDIR="/usr/share/licenses/$pkgname" install
}
