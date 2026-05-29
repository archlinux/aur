# Maintainer: greenelephante <your-email@example.com>
pkgname=zigmate
pkgver=1.0.0
pkgrel=1
pkgdesc="Terminal chess game with local hot-seat and network play over SSH (written in Zig)"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/greenelephante/zigmate"
license=('MIT')
makedepends=('zig')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/greenelephante/zigmate/archive/v${pkgver}.tar.gz")
sha256sums=('7856ca31a6067750310cea102d2f69d06733d93ee2bd93a744aa55ae3c52eb06')

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
