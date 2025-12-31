pkgname=ovpn-status-bin
pkgver=0.7.3
pkgrel=1
pkgdesc="OVPN's status page in the terminal."
url='https://github.com/APT37/ovpn-status'
arch=('x86_64')
license=('MIT-0')
source=("ovpn-status-$pkgver.elf::$url/releases/download/$pkgver/ovpn-status"
        "ovpn-status-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e20042b87cdc1f5d21bfa13362b993da2b863cbda6ea733a0fc66509b695851d'
            'f28b37a31a68c1fc7554b2b766e0f12653ff6c37093addee5570fe825fea3473')
options=('!lto')
provides=('ovpn-status')
conflicts=('ovpn-status' 'ovpn-status-git')

package() {
    install -Dm755 "ovpn-status-$pkgver.elf" "$pkgdir/usr/bin/ovpn-status"
    install -Dm644 "ovpn-status-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "ovpn-status-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
