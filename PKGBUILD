# Maintainer: DIMFLIX <dimflix.official@gmail.com>
pkgname=bluevein-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Bluetooth dual-boot key synchronization service (precompiled binary)"
arch=('x86_64')
url="https://github.com/meowrch/BlueVein"
license=('GPL-3.0')
depends=('dbus')
provides=('bluevein')
conflicts=('bluevein' 'bluevein-git')
install=bluevein.install
source=(
  "$url/releases/download/v$pkgver/bluevein-linux-x86_64"
  "bluevein.service::$url/raw/main/systemd/bluevein.service"
)
sha256sums=('89c8d41ab5b9b4fb2230a399e96cf420ba78c4df9cbae77553059359d3d6f30c' 'SKIP')

package() {
  # Install binary
  install -Dm755 bluevein-linux-x86_64 "$pkgdir/usr/bin/bluevein"
  
  # Install systemd service
  install -Dm644 bluevein.service "$pkgdir/usr/lib/systemd/system/bluevein.service"
}
