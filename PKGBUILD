# Maintainer: Jonathan Rouleau <jonathan@rouleau.io>

pkgname=bluetooth-autoconnect
pkgver=1.3
pkgrel=1
pkgdesc="A service to automatically connect to all paired and trusted bluetooth devices"
arch=('any')
url="https://github.com/jrouleau/bluetooth-autoconnect"
license=('MIT')
depends=('bluez' 'python' 'python-prctl' 'python-dbus' 'python-gobject')
optdepends=('pulseaudio: auto connect bluetooth headsets/speakers')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jrouleau/bluetooth-autoconnect/archive/v${pkgver}.tar.gz")
sha256sums=('f2a9cbcc3fee29d5f35549bdc3ee044acfcf5ba0d58345b89ae0bb2611580c5c')

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 0755 bluetooth-autoconnect "$pkgdir/usr/bin/bluetooth-autoconnect"
  install -Dm 0644 bluetooth-autoconnect.service "$pkgdir/usr/lib/systemd/system/bluetooth-autoconnect.service"
  install -Dm 0644 pulseaudio-bluetooth-autoconnect.service "$pkgdir/usr/lib/systemd/user/pulseaudio-bluetooth-autoconnect.service"
}
