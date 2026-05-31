# Maintainer: greenelephante greenelephante112233@gmail.com
pkgname=zigmate
pkgver=1.1.0
pkgrel=1
pkgdesc="Terminal chess game with local hot-seat and network play over SSH (written in Zig)"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/greenelephante/zigmate"
license=('MIT')
makedepends=('zig')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/greenelephante/zigmate/archive/v${pkgver}.tar.gz")
sha256sums=('67ad09559eadd56895918834c29b40f01dc4b4cf3e9f4766db103266532fb471')

build() {
    cd "zigmate"
    zig build -Doptimize=ReleaseSafe
}

package() {
    cd "zigmate"
    install -Dm755 zig-out/bin/zigmate "$pkgdir/usr/bin/zigmate"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
