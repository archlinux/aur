# Maintainer: Sergey Desyatkov <sergeidesyatkov@gmail.com>

pkgname=sonido
pkgver=1.9.0
pkgrel=1
pkgdesc="A sleek, terminal-based music player written in Rust"
arch=('x86_64')
url="https://github.com/desyatkoff/sonido"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'alsa-lib')
makedepends=('rust')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e6b1d589c14e21a6d897181326d132783357409338bcea50967fbada2a581226')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
