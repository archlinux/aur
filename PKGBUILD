# Maintainer: jD91mZM2 <me@krake.one>
pkgname=cargo-release
pkgver=0.10.4
pkgrel=1
pkgdesc="Cargo subcommand \"release\": everything about releasing a rust crate."
url="https://github.com/sunng87/cargo-release"
arch=("x86_64")
license=("MIT" "APACHE")
makedepends=("rust")
optdepends=()
depends=()
source=("https://github.com/sunng87/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('45ea73f91c9989298eb02f640f886eb48dbad2e33af8334355d43d27d088868f')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
