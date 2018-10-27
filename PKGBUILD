# Maintainer: Alexander Samoylenko <lxmnk@tuta.io>
pkgname=xidlehook
pkgver=0.5.0
pkgrel=1
pkgdesc="xautolock rewrite in Rust, with a few extra features"
url="https://github.com/jD91mZM2/xidlehook"
arch=("x86_64")
license=("MIT")
makedepends=("rust" "libxss")
optdepends=()
depends=("libpulse")
source=("https://github.com/jD91mZM2/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('b62bb653c7361a8f3ba7c338822a042a3ce97987a1d5b418591d8df34634f8c6')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
