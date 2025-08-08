pkgname=ovpn-status-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="OVPN's status page in the terminal."
url='https://github.com/APT37/ovpn-status'
arch=('x86_64')
license=('MIT-0')
source=("ovpn-status-$pkgver.elf::$url/releases/download/$pkgver/ovpn-status"
        "ovpn-status -$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e4e3200135f92d64fd9c613fd153f718f5dcbcd4eab717cbf0ad3f7805421665'
            '3bbbb3450250eb7605dd7b8c2ea47abeb551d64fa8287d3d9400dade2a1c1c79')
options=('!lto')
provides=('ovpn-status')
conflicts=('ovpn-status' 'ovpn-status-git')

package() {
    install -Dm755 "ovpn-status-$pkgver.elf" "$pkgdir/usr/bin/ovpn-status"
    install -Dm644 "ovpn-status-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "ovpn-status-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
