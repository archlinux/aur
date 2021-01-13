# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=dotenv-linter
pkgver=3.0.0
pkgrel=1
pkgdesc="Lightning-fast linter for .env files. Written in Rust"
arch=('x86_64')
url="https://github.com/dotenv-linter/dotenv-linter"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a858a4ff6121ec9d9a8889b8bb8d3fd88497c8142c5c5d087a6f169bfd19d73f')

build() {
    cd $pkgname-$pkgver
    cargo build --release --locked
}

check() {
    cd $pkgname-$pkgver
    cargo test --release --locked
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
