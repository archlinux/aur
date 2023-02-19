# Maintainer:  Devorlon <root[at]devorlon[dot]xyz>

pkgname=brightness
pkgver=1.0
pkgrel=1
pkgdesc="Adjust monitor brightness using ddcutil"
arch=('any')
license=('GPL')
depends=('ddcutil')
source=('brightness' 'brightness.service')
md5sums=('SKIP'
	 'SKIP')

package() {
  # Install script to /usr/bin
  install -Dm755 "$srcdir/brightness" "$pkgdir/usr/bin/brightness"

  # Install service to systemd user directory
  install -Dm644 "$srcdir/brightness.service" "$pkgdir/etc/systemd/system/brightness.service"

  # Create user systemd directory if it doesn't exist
  mkdir -p "$pkgdir/etc/systemd/user/"
}
