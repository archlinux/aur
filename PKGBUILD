# Maintainer: RAprogramm <andrey.rozanov.vl@gmail.com>
pkgname=hydebar-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Status bar for Hyprland, themed by the HyDE desktop (binary package)"
arch=('x86_64')
url="https://github.com/HyDE-Project/hydebar"
license=('GPL-3.0-or-later')
depends=(
  'dbus'
  'libpulse'
  'pipewire'
  'wayland'
  'xkbcommon'
)
provides=('hydebar')
conflicts=('hydebar')
source=("$pkgname-$pkgver.tar.gz::https://github.com/HyDE-Project/hydebar/releases/download/v${pkgver}/hydebar-${pkgver}-x86_64-linux-gnu.tar.gz")
sha256sums=('f25ef7cd0433dbe993442decfa10c7dbaa3a5adb8c84a0c986560aaf6c7f44ea')

package() {
  # Install binary
  install -Dm755 hydebar "$pkgdir/usr/bin/hydebar"

  # Install theme switch script
  install -Dm755 hydebar-theme-switch "$pkgdir/usr/bin/hydebar-theme-switch"

  # Install D-Bus service file
  install -Dm644 org.freedesktop.Notifications.service \
    "$pkgdir/usr/share/dbus-1/services/org.freedesktop.Notifications.service"

  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  # Install licenses
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 LICENSE.MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE.MIT"
}
