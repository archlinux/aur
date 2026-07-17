# Maintainer: James Verhoef jamesverhoef2010@gmail.com
pkgname=rockscript
pkgver=0.2.1
pkgrel=1
pkgdesc="Esolang named rockscript"
arch=('x86_64')
url="https://github.com/kirbytheburger/rockscript"
license=('MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('f068791a066b79b1ab3e4a71e4d22b8d68c34050adde419621a21d7277843673')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
