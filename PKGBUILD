# Maintainer: Saimon Dahal <saimondahal66@gmail.com>
pkgname=miti
pkgver=0.1.3
pkgrel=1
pkgdesc="A beautiful TUI calendar viewer with AD and BS (Bikram Sambat) support"
arch=('x86_64')
url="https://github.com/saimon-dahal/miti"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2692e4ddf347b5240a518616c78c4f2b0aee396395ec056a3611c3fa5ff9a2f7')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
