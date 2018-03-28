# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=kodi-standalone-service
pkgver=1.93
pkgrel=2
pkgdesc="Systemd service to run kodi in stand-alone mode without a DE"
# Do NOT attempt to use this package on Arch ARM! This is only for x86_64/i686.
# You have been warned.
arch=('x86_64')
url="https://github.com/graysky2/kodi-standalone-service"
license=('GPL')
depends=('systemd' 'xorg-server' 'xorg-xinit' 'kodi' 'polkit')
replaces=('xbmc-standalone-service')
install=readme.install
source=("https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('da8fa6585b60f47242f1ae4f164f1271726047f99926f8ded3d5103b11708ac4')

package() {
  install -Dm644 "$srcdir/$pkgname-$pkgver/init/kodi.service" \
    "$pkgdir/usr/lib/systemd/system/kodi.service"
  install -dm 700 "$pkgdir"/var/lib/kodi
  chown 420:420 "$pkgdir"/var/lib/kodi
}

# vim:set ts=2 sw=2 et:
