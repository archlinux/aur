# Maintainer: Its-Alex <me@itsalex.fr>
pkgname=gp-tray
pkgver=1.2.1
pkgrel=1
pkgdesc="GlobalProtect VPN system-tray indicator for gpclient with multi-portal switching, desktop alerts and a systemd user service"
arch=('any')
url="https://github.com/Its-Alex/gp-tray"
license=('MIT')
install=gp-tray.install
depends=('python' 'python-gobject' 'gtk3' 'libayatana-appindicator' 'libnotify'
         'polkit' 'globalprotect-openconnect' 'hicolor-icon-theme'
         'iproute2' 'systemd' 'xdg-utils')
optdepends=('gnome-shell-extension-appindicator: tray icon on vanilla GNOME Shell')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('07a96b7618abd4e6f33b19678a5a7698a44ac4ad69cf7485f3b3d0b587390cf1')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
