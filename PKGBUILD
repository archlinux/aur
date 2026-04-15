# Maintainer: Stefan Mayer-Popp <stefan@mayer-popp.de>
pkgname=hid-telephony-bridge
pkgver=0.1.1
pkgrel=1
pkgdesc="USB HID Telephony mute bridge for Linux/PipeWire (default: Shure MV7+)"
arch=('any')
url="https://github.com/fuxx/hid-telephony-bridge"
license=('GPL-3.0-only')
depends=('python' 'pipewire-pulse')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7ac694c527e7c11140b8164551d762fbe305ea53d34f1817cf0ac1b6aba87e28')
install=hid-telephony-bridge.install

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 hid-telephony-bridge.py "$pkgdir/usr/bin/hid-telephony-bridge"
    install -Dm644 99-hid-telephony-bridge.rules "$pkgdir/usr/lib/udev/rules.d/99-hid-telephony-bridge.rules"
    install -Dm644 hid-telephony-bridge.service "$pkgdir/usr/lib/systemd/user/hid-telephony-bridge.service"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
