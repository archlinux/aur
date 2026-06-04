# Maintainer: kvunoff <kvunoff@proton.me>
pkgname=araloader
pkgver=0.1.0
pkgrel=1
pkgdesc="Build self-decrypting Windows executables from C byte array payloads"
arch=('x86_64')
url="https://github.com/kvunoff/AraLoader"
license=('MIT')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7ffb48d9711ea26105e4eb3332c12b83ce044619e3e80312e922099792721b39')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
}
