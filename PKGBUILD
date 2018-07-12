# Maintainer: lxmnk <lxmnk@tuta.io>
pkgname=xidlehook
pkgver=0.4.9
pkgrel=1
pkgdesc="xautolock rewrite in Rust, with a few extra features"
url="https://github.com/jD91mZM2/xidlehook"
arch=("x86_64")
license=("MIT")
makedepends=("rust" "libxss")
optdepends=()
depends=("libpulse")
source=("https://github.com/jD91mZM2/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('5fbbc783ebe11b15622197e25760dd5ca6a3739b1cdd889d01b46f673c531828')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
