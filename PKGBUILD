# Maintainer: jD91mZM2 <me@krake.one>
pkgname="xidlehook"
pkgver=0.4.5
pkgrel=1
pkgdesc="xautolock rewrite in Rust, with a few extra features"
url="https://github.com/jD91mZM2/xidlehook"
arch=("x86_64")
license=("MIT")
makedepends=("rust" "libxss")
optdepends=()
depends=("libpulse")
source=("https://github.com/jD91mZM2/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('b4429acf12a396f0c74672fbfeca653f55cbf5267a44d2b3215b4840657b28a4')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
