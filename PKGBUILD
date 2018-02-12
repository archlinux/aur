# Maintainer: jD91mZM2 <me@krake.one>
pkgname="cargo-release"
pkgver=0.9.0
pkgrel=1
pkgdesc="Cargo subcommand "release""
url="https://github.com/sunng87/cargo-release"
arch=("x86_64")
license=("MIT" "APACHE")
makedepends=("rust")
optdepends=()
depends=()
source=("https://github.com/sunng87/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('614773b507a3959322074422d81ef29a3d00e608530ab3d803f65ba7cca84114')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
