# Maintainer: kvunoff <kvunoff@proton.me>
pkgname=araloader
pkgver=0.1.1
pkgrel=1
pkgdesc="Build self-decrypting Windows executables from C byte arrays"
arch=('x86_64')
url="https://github.com/kvunoff/AraLoader"
license=('MIT')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f3a983fabc20a9865eada0a5d922ea3fb68611f79463bd6a25585c928708334d')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
}
