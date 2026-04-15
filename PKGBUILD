# Maintainer: Stefan Mayer-Popp <stefan@mayer-popp.de>
pkgname=hid-telephony-bridge
pkgver=0.1.2
pkgrel=1
pkgdesc="USB HID Telephony mute bridge for Linux/PipeWire (default: Shure MV7+)"
arch=('any')
url="https://github.com/fuxx/hid-telephony-bridge"
license=('GPL-3.0-only')
depends=('python' 'pipewire-pulse')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('562304735f4f6f38f06462f65cfa1702da5344f003c3a780bf2a7dc74b96be9e')
install=hid-telephony-bridge.install

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 hid-telephony-bridge.py "$pkgdir/usr/bin/hid-telephony-bridge"
    install -Dm644 99-hid-telephony-bridge.rules "$pkgdir/usr/lib/udev/rules.d/99-hid-telephony-bridge.rules"
    install -Dm644 hid-telephony-bridge.service "$pkgdir/usr/lib/systemd/user/hid-telephony-bridge.service"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
