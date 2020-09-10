# Maintainer: jD91mZM2 <me@krake.one>
pkgname=cargo-release
pkgver=0.13.6
pkgrel=1
pkgdesc="Cargo subcommand \"release\": everything about releasing a rust crate."
url="https://github.com/sunng87/cargo-release"
arch=("x86_64")
license=("MIT" "APACHE")
makedepends=("rust")
optdepends=()
depends=()
source=("https://github.com/sunng87/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('fc7f54f066cd5b164e619d6f3dc962be1c7379831e12c42e734e354918bfc87c')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --locked --release --all-features
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
