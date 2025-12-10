# Maintainer: t4t5 <tristan@trist.dev>
pkgname=hypruler
pkgver=0.1.1
pkgrel=1
pkgdesc="Measure anything on your screen."
arch=('x86_64')
url="https://github.com/t4t5/hypruler"
license=('MIT')
depends=('fontconfig')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/t4t5/hypruler/archive/v$pkgver.tar.gz")
sha256sums=('0d11e6ede884ff5492e12fbe6b26b785bee0c6013630020a1c0245a517f4c399')

build() {
    cd "$pkgname-$pkgver"
    export CARGO_TARGET_DIR=target
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/hypruler" "$pkgdir/usr/bin/hypruler"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
