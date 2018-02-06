# Maintainer: jD91mZM2 <me@krake.one>
pkgname="xidlehook"
pkgver=0.4.3
pkgrel=1
pkgdesc="xautolock rewrite in Rust, with a few extra features"
url="https://github.com/jD91mZM2/xidlehook"
arch=("x86_64")
license=("MIT")
makedepends=("rust")
optdepends=()
depends=()
source=("https://github.com/jD91mZM2/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('28bb6ff748db6f92ef2b1341f8d0509cff3c164386480e7b32a5c3030cafdda4')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
