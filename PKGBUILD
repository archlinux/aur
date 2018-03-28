# Maintainer: jD91mZM2 <me@krake.one>
pkgname="cargo-release"
pkgver=0.10.0
pkgrel=1
pkgdesc="Cargo subcommand "release""
url="https://github.com/sunng87/cargo-release"
arch=("x86_64")
license=("MIT" "APACHE")
makedepends=("rust")
optdepends=()
depends=()
source=("https://github.com/sunng87/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('aa01f6c07d97c84ea1188f0f528413cc0ac660f29351652ffa50cb7ff2f86114')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
