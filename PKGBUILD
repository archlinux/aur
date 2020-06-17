# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=choose
pkgver=1.2.0
pkgrel=1
pkgdesc="A human-friendly and fast alternative to cut and (sometimes) awk"
arch=('x86_64')
url="https://github.com/theryangeary/choose"
license=('GPL3')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5711a301e8cc7a5f257773feef992ce8da714a9ee167f234943203ee36c923ad')

build() {
    cd $pkgname-$pkgver
    cargo build --release --locked
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
}
