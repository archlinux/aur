# Maintainer: Jonathan Rouleau <jonathan@rouleau.io>

pkgname=bluetooth-autoconnect
pkgver=1.0
pkgrel=1
pkgdesc="A service to automatically connect to all paired and trusted bluetooth devices"
arch=('any')
url="https://github.com/jrouleau/bluetooth-autoconnect"
license=('MIT')
depends=('bluez' 'python' 'python-dbus')
source=("https://github.com/jrouleau/bluetooth-autoconnect/archive/v${pkgver}.tar.gz")
sha256sums=('eb7795401043ef17fdd6c785df20184b17a4eb610c08325353ef5084ff0adda7')

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 0755 bluetooth-autoconnect "$pkgdir/usr/bin/bluetooth-autoconnect"
  install -Dm 0644 bluetooth-autoconnect.service "$pkgdir/usr/lib/systemd/system/bluetooth-autoconnect.service"
}
