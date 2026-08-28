# Maintainer: amigoDcyber <lionmafia810@gmail.com>

pkgname=oniondownoda
pkgver=3.0.0
pkgrel=1
pkgdesc="🧅 A beautiful TUI for downloading files from .onion URLs over Tor"
arch=('x86_64')
url="https://github.com/manziamigocyber/OnionDownOda"
license=('MIT')
depends=('tor')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/manziamigocyber/OnionDownOda/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('17d10c91314e88e343adc221b94c31c57aec7ac0cb37aaa4aa9e965937ae45e8')

build() {
    cd "OnionDownOda-$pkgver"
    cargo build --release --locked
}

package() {
    cd "OnionDownOda-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
