# Maintainer: t4t5 <tristan@trist.dev>
pkgname=hypruler
pkgver=0.1.0
pkgrel=1
pkgdesc="Measure anything on your screen."
arch=('x86_64')
url="https://github.com/t4t5/hypruler"
license=('MIT')
depends=('fontconfig')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/t4t5/hypruler/archive/v$pkgver.tar.gz")
sha256sums=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')

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
