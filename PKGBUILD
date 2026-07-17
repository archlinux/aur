# Maintainer: James Verhoef jamesverhoef2010@gmail.com
pkgname=rockscript
pkgver=0.2.2
pkgrel=1
pkgdesc="Esolang named rockscript"
arch=('x86_64')
url="https://github.com/kirbytheburger/rockscript"
license=('MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('532ef9b7c8643fddb05346a235626f429c2401d7ab2779b12a9b65e7bcf2cad7')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
