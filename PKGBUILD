# Maintainer: RustyWaffle <rustywaffle@seznam.cz>
pkgname=pacpeek
pkgver=0.1.1
pkgrel=1
pkgdesc="A small CLI tool that is completely unnecessary, but way cooler than pacman -Qi"
arch=('x86_64')
url="https://github.com/RustyWaffle/pacpeek"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RustyWaffle/pacpeek/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5c69c9d8faeb4cfa0e3ae5e6dbdd7596288bd9fa5b15f46c9a36b7fe2c3c3f20')
options=(!debug)

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
