# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=dotenv-linter
pkgver=2.2.0
pkgrel=1
pkgdesc="Lightning-fast linter for .env files. Written in Rust"
arch=('x86_64')
url="https://github.com/dotenv-linter/dotenv-linter"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6e24bc8c6908abbef35c217c6398623246c536af2da5f72fb9f55f2b364d14be')

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
