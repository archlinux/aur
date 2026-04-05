# Maintainer: Ashley <ashley at nullworks dot dev>
pkgname=ratride
pkgver=1.2.1
pkgrel=1
pkgdesc="Markdown slide presenter for TUI & Web"
arch=('x86_64')
url="https://github.com/fand/ratride"
license=('MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')
sha256sums=('864fef815d32b9884afa3a64bd47bac4a5e0a1615227937b61188e53699af41e')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
