# Maintainer: jD91mZM2 <me@krake.one>
pkgname="xidlehook"
pkgver=0.3.0
pkgrel=1
pkgdesc="xautolock rewrite in Rust, with a few extra features"
url="https://github.com/jD91mZM2/xidlehook"
arch=("x86_64")
license=("MIT")
makedepends=("rust")
optdepends=()
depends=()
source=("https://github.com/jD91mZM2/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('beb9935a9654e732bd848ef9ba554ff2656bd6c49cabebc2dee413b670470850')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
