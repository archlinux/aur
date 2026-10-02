# Maintainer: Its-Alex <me@itsalex.fr>
pkgname=gp-tray
pkgver=1.0.0
pkgrel=2
pkgdesc="GlobalProtect VPN system-tray indicator for gpclient with multi-portal switching, desktop alerts and a systemd user service"
arch=('any')
url="https://github.com/Its-Alex/gp-tray"
license=('MIT')
depends=('python-gobject' 'gtk3' 'libayatana-appindicator' 'libnotify'
         'polkit' 'globalprotect-openconnect' 'hicolor-icon-theme')
optdepends=('gnome-shell-extension-appindicator: tray icon on vanilla GNOME Shell')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('66dfdf65949b9da130bd8bd6d8c66599e887672742d7b12737ae60b1a74ed989')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
