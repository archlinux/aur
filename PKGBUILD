# Maintainer: MaPu <manpuk@protonmail.com>
pkgname=mapu_calculator
pkgver=0.2.0
pkgrel=1
pkgdesc="A customizable calculator for Linux, built with Iced."
arch=('x86_64')
url="https://codeberg.org/MaPu/mapu_calculator"
license=('GPL-3.0-only')
depends=()
makedepends=('cargo' 'git')
source=("https://codeberg.org/MaPu/mapu_calculator/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname"
	cargo build --release
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/mapu_calculator" "$pkgdir/usr/bin/mapu_calculator"
    install -Dm644 \
        LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 \
        README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
}
