# Maintainer: DIMFLIX <dimflix.official@gmail.com>
pkgname=bluevein-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Bluetooth dual-boot key synchronization service (precompiled binary)"
arch=('x86_64')
url="https://github.com/meowrch/BlueVein"
license=('GPL-3.0')
depends=('dbus')
provides=('bluevein')
conflicts=('bluevein' 'bluevein-git')
source=(
  "$url/releases/download/v$pkgver/bluevein-linux-x86_64"
  "bluevein.service::$url/raw/main/systemd/bluevein.service"
)
sha256sums=('5d7ae3c3fef0c9bd06e56d0e053368dbb1a4ba29dd8e49c3e9adba3f38a74684' 'SKIP')

package() {
  # Install binary
  install -Dm755 bluevein-linux-x86_64 "$pkgdir/usr/bin/bluevein"
  
  # Install systemd service
  install -Dm644 bluevein.service "$pkgdir/usr/lib/systemd/system/bluevein.service"
}
