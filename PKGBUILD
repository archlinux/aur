# Maintainer: kvunoff <kvunoff@proton.me>
pkgname=araloader
pkgver=0.2.0
pkgrel=1
pkgdesc="Build self-decrypting Windows executables from C byte arrays"
arch=('x86_64')
url="https://github.com/kvunoff/AraLoader"
license=('MIT')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2d326cf02b249720e3b2d2e00dbd455fbf8bf8121c14c84a1ac207e3252f43e8')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
}
