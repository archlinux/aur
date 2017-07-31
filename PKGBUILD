# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=kodi-standalone-service
pkgver=1.91
pkgrel=1
pkgdesc="Systemd service to run kodi in stand-alone mode without a DE"
# Do NOT attempt to use this package on Arch ARM! This is only for x86_64/i686.
# You have been warned.
arch=('x86_64' 'i686')
url="https://github.com/graysky2/kodi-standalone-service"
license=('GPL')
depends=('systemd' 'xorg-server' 'xorg-xinit' 'kodi' 'polkit')
replaces=('xbmc-standalone-service')
install=readme.install
source=("https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('08a21c0697a2669f2cfc2aaacaa21515068cfd33a7d1b42ce9b2590a996e1329')

package() {
  install -Dm644 "$srcdir/$pkgname-$pkgver/init/kodi.service" \
    "$pkgdir/usr/lib/systemd/system/kodi.service"
  install -dm 700 "$pkgdir"/var/lib/kodi
  chown 420:420 "$pkgdir"/var/lib/kodi
}

# vim:set ts=2 sw=2 et:
