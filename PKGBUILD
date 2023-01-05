# Maintainer: Eric Sandoval <esandovalruezga@gmail.com>
# Contributor: Alexander Samoylenko <lxmnk@tuta.io>
pkgname=xidlehook
pkgver=0.10.0
pkgrel=1
pkgdesc="xautolock rewrite in Rust, with a few extra features"
url="https://gitlab.com/jD91mZM2/xidlehook"
arch=("x86_64" "aarch64")
license=("MIT")
makedepends=("rust" "libxss" "python")
optdepends=()
depends=("libpulse")
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('66751b78c5174c0e430d9becd749771d593f388db348514d8c3256670dc77cd8')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 755 -t "$pkgdir/usr/bin" "target/release/$pkgname"{,-client}
}
