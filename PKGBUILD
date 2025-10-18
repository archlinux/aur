pkgname=rsecure
pkgver=0.3.0
pkgrel=1
pkgdesc="Secure file encryption CLI written in Rust"
arch=('x86_64')
url="https://github.com/containerscrew/rsecure"
license=('GPL3')
depends=()
makedepends=('rust' 'cargo')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/rsecure" "$pkgdir/usr/bin/rsecure"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

