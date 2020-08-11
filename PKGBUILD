# Maintainer: Jonathan Rouleau <jonathan@rouleau.io>

pkgname=bluetooth-autoconnect
pkgver=1.2
pkgrel=1
pkgdesc="A service to automatically connect to all paired and trusted bluetooth devices"
arch=('any')
url="https://github.com/jrouleau/bluetooth-autoconnect"
license=('MIT')
depends=('bluez' 'python' 'python-prctl' 'python-dbus' 'python-gobject')
optdepends=('pulseaudio: auto connect bluetooth headsets/speakers')
source=("https://github.com/jrouleau/bluetooth-autoconnect/archive/v${pkgver}.tar.gz")
sha256sums=('5923a73263d81376010721ea16ad8ebd994862c0a344d4af0e7b9eb03c10d525')

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 0755 bluetooth-autoconnect "$pkgdir/usr/bin/bluetooth-autoconnect"
  install -Dm 0644 bluetooth-autoconnect.service "$pkgdir/usr/lib/systemd/system/bluetooth-autoconnect.service"
  install -Dm 0644 pulseaudio-bluetooth-autoconnect.service "$pkgdir/usr/lib/systemd/user/pulseaudio-bluetooth-autoconnect.service"
}
