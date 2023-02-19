# Maintainer:  Devorlon <root@devorlon.xyz>

pkgname=brightness
pkgver=1.0
pkgrel=1
pkgdesc="Adjust monitor brightness using ddcutil"
arch=('any')
license=('GPL')
depends=('ddcutil')

package() {
  # Install script to /usr/bin
  install -Dm755 "$startdir/brightness" "$pkgdir/usr/bin/brightness"

  # Install service to systemd user directory
  install -Dm644 "$startdir/brightness.service" "$pkgdir/etc/systemd/system/brightness.service"

  # Create user systemd directory if it doesn't exist
  mkdir -p "$pkgdir/etc/systemd/user/"
}
