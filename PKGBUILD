# Maintainer: Alexander Samoylenko <lxmnk@tuta.io>
pkgname=xidlehook
pkgver=0.8.1
pkgrel=1
pkgdesc="xautolock rewrite in Rust, with a few extra features"
url="https://gitlab.com/jD91mZM2/xidlehook"
arch=("x86_64")
license=("MIT")
makedepends=("rust" "libxss" "python")
optdepends=()
depends=("libpulse")
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('8b9baeb0feee95b6b4ad8cfcd089f2ec672f89e0ab94d09ba2f00e3a611d70b7')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 755 -t "$pkgdir/usr/bin" "target/release/$pkgname"{,-client}
}
