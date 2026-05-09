# Maintainer: DIMFLIX <dimflix.official@gmail.com>
pkgname=bluevein-bin
pkgver=1.1.2
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
sha256sums=('521c9b11a148e8e38324f6d749498af931f69dcce44b3b26553ad50590133a13' 'SKIP')

package() {
  # Install binary
  install -Dm755 bluevein-linux-x86_64 "$pkgdir/usr/bin/bluevein"
  
  # Install systemd service
  install -Dm644 bluevein.service "$pkgdir/usr/lib/systemd/system/bluevein.service"
}
