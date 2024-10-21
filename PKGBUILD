pkgname=ray_translate
pkgver="stable"
pkgrel=3
pkgdesc="A simple raycast like translator from prompt."
arch=('x86_64')
license=('MIT')
depends=('rust' 'cargo' 'translate-shell')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/veaquer/ray_translate/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e5cbf3d427ff5091bccc3def587612c1f7fa5e5de901eaab3fb6d6ec152840e5')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/ray_translate" "$pkgdir/usr/bin/ray_translate"
}
