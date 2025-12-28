pkgname=ovpn-status-bin
pkgver=0.7.2
pkgrel=1
pkgdesc="OVPN's status page in the terminal."
url='https://github.com/APT37/ovpn-status'
arch=('x86_64')
license=('MIT-0')
source=("ovpn-status-$pkgver.elf::$url/releases/download/$pkgver/ovpn-status"
        "ovpn-status -$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('21e3b47d307f0d33047df8ec969f44e73473d88edd24f15d94e0095a37cedc80'
            '0388c187681f13dd6c704c2a1319cce15b416c66041ddf0aaa5f9e3f73f1d458')
options=('!lto')
provides=('ovpn-status')
conflicts=('ovpn-status' 'ovpn-status-git')

package() {
    install -Dm755 "ovpn-status-$pkgver.elf" "$pkgdir/usr/bin/ovpn-status"
    install -Dm644 "ovpn-status-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "ovpn-status-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
