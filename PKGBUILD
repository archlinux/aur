# Maintainer: Alexander Samoylenko <lxmnk@tuta.io>
pkgname=xidlehook
pkgver=0.7.0
pkgrel=1
pkgdesc="xautolock rewrite in Rust, with a few extra features"
url="https://gitlab.com/jD91mZM2/xidlehook"
arch=("x86_64")
license=("MIT")
makedepends=("rust" "libxss")
optdepends=()
depends=("libpulse")
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('e1f7e2d854711848c21298fc5747af45693bbe63ea811ab7bff9c15dbccd61d4')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
