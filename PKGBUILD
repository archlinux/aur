# Maintainer: jD91mZM2 <me@krake.one>
pkgname=cargo-release
pkgver=0.13.8
pkgrel=1
pkgdesc="Cargo subcommand \"release\": everything about releasing a rust crate."
url="https://github.com/sunng87/cargo-release"
arch=("x86_64")
license=("MIT" "APACHE")
makedepends=("rust")
optdepends=()
depends=()
source=("https://github.com/sunng87/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('3c42e61761df06adfddc8934893d5a104f1486960fcf19a2e900d7ddb5e0fb0f')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --locked --release --all-features
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
