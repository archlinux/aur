# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
pkgname=wmfocus
pkgver=1.1.0
pkgrel=1
pkgdesc="Visually focus window by label"
url="https://github.com/svenstaro/wmfocus"
arch=("x86_64")
license=("MIT")
depends=("xcb-util-keysyms" "cairo" "libxkbcommon-x11")
makedepends=("rust" "python")
source=("https://github.com/svenstaro/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('fb3bc44b5c45cff4275dcbd01ad20c5289cc4a9b48e9fa81e7e1a2327b998d84c826165a1b23017ad23b8f86da1515b2bac392fdbd5aa175abadafc99dbf105d')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --features i3
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
