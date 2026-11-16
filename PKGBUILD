# Maintainer: NSky Labs <nskysoft at gmail dot com>

pkgname=nsky-gdrive-sync
_name=gdrive-sync
pkgver=0.1.0
pkgrel=1
pkgdesc='Bidirectional Google Drive sync with real-time local file watching'
arch=('any')
url='https://github.com/NSky/gdrive-sync'
license=('MIT')
depends=('bash' 'rclone' 'inotify-tools' 'jq' 'systemd')
install=gdrive-sync.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('59b6b437ba8fbc52fa8beb767ec1d43521fa4b5f8e950a5a848608d68496629e')

check() {
  cd "$_name-$pkgver"
  make check
}

package() {
  cd "$_name-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr LICENSEDIR="/usr/share/licenses/$pkgname" install
}
