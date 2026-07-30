# Maintainer: James Verhoef jamesverhoef2010@gmail.com
pkgname=rockscript
pkgver=0.2.4
pkgrel=1
pkgdesc="Esolang named rockscript"
arch=('x86_64')
url="https://github.com/kirbytheburger/rockscript"
license=('MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('15b553955d97a41634061aca3e3a83b485d8169aa7be4fc8e60c5a3adbe90f58')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
