# Maintainer: Sergey Desyatkov <sergeydesyatkov@proton.me>

pkgname=sonido
pkgver=1.10.0
pkgrel=1
pkgdesc="A sleek, terminal-based music player written in Rust"
arch=('x86_64')
url="https://github.com/desyatkoff/sonido"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'alsa-lib')
makedepends=('rust')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('527340b591628df37f4f4d6788fa2d4b6191d42fdbb9d1a1e45250ceb202d37d')

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
