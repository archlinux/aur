# Maintainer: t4t5 <t4t5@hey.com>
pkgname=hypruler
pkgver=0.4.0
pkgrel=1
pkgdesc="Measure anything on your screen."
arch=('x86_64')
url="https://github.com/t4t5/hypruler"
license=('MIT')
depends=('fontconfig')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/t4t5/hypruler/archive/v$pkgver.tar.gz")
sha256sums=('df3312df1c56ccb6ed94b14510b56cd601fbc3013239f2261b41d1ff0751d241')

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
