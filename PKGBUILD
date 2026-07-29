# Maintainer: James Verhoef jamesverhoef2010@gmail.com
pkgname=rockscript
pkgver=0.2.3
pkgrel=1
pkgdesc="Esolang named rockscript"
arch=('x86_64')
url="https://github.com/kirbytheburger/rockscript"
license=('MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('49229ff70edbe5607da59e2a30eb8f308db607ac528d9dfde6afb8a8e5b505ba')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
