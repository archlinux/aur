# Maintainer: realstrawhat <realstrawhat@users.noreply.github.com>

pkgname=csakura
pkgver=2.0.0
pkgrel=1
pkgdesc="A sakura tree with falling petals for your terminal (cmatrix-style)"
arch=('x86_64' 'aarch64')
url="https://github.com/realstrawhat/csakura"
license=('MIT')
depends=('ncurses')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('99a855bd1cd4ff76466ff74de298b6261b1d30ecb5430970a001f3d0e9bc318d')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
