# Maintainer: Stefan Mayer-Popp <stefan@mayer-popp.de>
pkgname=hid-telephony-bridge
pkgver=0.1.0
pkgrel=1
pkgdesc="USB HID Telephony mute bridge for Linux/PipeWire (default: Shure MV7+)"
arch=('any')
url="https://github.com/fuxx/hid-telephony-bridge"
license=('GPL-3.0-only')
depends=('python' 'pipewire-pulse')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ed63b187eabdd6b3e54d9754bb9cfcb5091c15860e12046f43af1848e4ce8efd')
install=hid-telephony-bridge.install

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 hid-telephony-bridge.py "$pkgdir/usr/bin/hid-telephony-bridge"
    install -Dm644 99-hid-telephony-bridge.rules "$pkgdir/usr/lib/udev/rules.d/99-hid-telephony-bridge.rules"
    install -Dm644 hid-telephony-bridge.service "$pkgdir/usr/lib/systemd/user/hid-telephony-bridge.service"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
