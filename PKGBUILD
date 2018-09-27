# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
pkgname=wmfocus
pkgver=1.0.1
pkgrel=1
pkgdesc="Visually focus window by label"
url="https://github.com/svenstaro/wmfocus"
arch=("x86_64")
license=("MIT")
depends=("xcb-util-keysyms" "cairo" "libxkbcommon-x11")
makedepends=("rust" "python")
source=("https://github.com/svenstaro/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('334d3d6a1cd900fc1f7da260ae1a7db528b1614a8fd82cc8f9724919fe8f371da35c295f149bf6f21883ea980a67d12347d5a62e5cec3e0e783e1cc5d8f1eaab')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --features i3
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
