pkgname=ray_translate
pkgver="beta"
pkgrel=1
pkgdesc="A simple raycast like translator from prompt."
arch=('x86_64')
license=('MIT')
depends=('rust' 'cargo' 'translate-shell')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/veaquer/ray_translate/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6b86423e62cf70ce34d2ca39dea824ad09e023f1a9bad6d79e703658082f9fe0')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/ray_translate" "$pkgdir/usr/bin/ray_translate"
}
