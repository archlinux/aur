# Maintainer: Jonathan Rouleau <jonathan@rouleau.io>

pkgname=bluetooth-autoconnect
pkgver=1.1
pkgrel=3
pkgdesc="A service to automatically connect to all paired and trusted bluetooth devices"
arch=('any')
url="https://github.com/jrouleau/bluetooth-autoconnect"
license=('MIT')
depends=('bluez' 'python' 'python-dbus' 'python-gobject')
optdepends=('pulseaudio: auto connect bluetooth headsets/speakers')
source=("https://github.com/jrouleau/bluetooth-autoconnect/archive/v${pkgver}.tar.gz")
sha256sums=('9145247d3e4a1466fe3448a6973dba782239dc111b629a61885a115b125d5b7e')

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 0755 bluetooth-autoconnect "$pkgdir/usr/bin/bluetooth-autoconnect"
  install -Dm 0644 bluetooth-autoconnect.service "$pkgdir/usr/lib/systemd/system/bluetooth-autoconnect.service"
  install -Dm 0644 pulseaudio-bluetooth-autoconnect.service "$pkgdir/usr/lib/systemd/user/pulseaudio-bluetooth-autoconnect.service"
}
