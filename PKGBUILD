# Maintainer: jD91mZM2 <me@krake.one>
pkgname="cargo-release"
pkgver=0.10.1
pkgrel=1
pkgdesc="Cargo subcommand "release""
url="https://github.com/sunng87/cargo-release"
arch=("x86_64")
license=("MIT" "APACHE")
makedepends=("rust")
optdepends=()
depends=()
source=("https://github.com/sunng87/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('f1f0e462b691c16e3986fd86c0d5b9fde9c184dc1e971076701edb0b1fe85586')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
