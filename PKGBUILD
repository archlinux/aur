# Maintainer: amigoDcyber <your-email@gmail.com>
pkgname=oniondownoda
pkgver=0.1.1
pkgrel=1
pkgdesc="🧅 A beautiful TUI for downloading files from .onion URLs over Tor"
arch=('x86_64')
url="https://github.com/amigoDcyber/OnionDownOda"
license=('MIT')
depends=('tor')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/amigoDcyber/OnionDownOda/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "OnionDownOda-$pkgver"
    cargo build --release --locked
}

package() {
    cd "OnionDownOda-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
