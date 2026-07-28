# Maintainer: RustyWaffle <rustywaffle@seznam.cz>
pkgname=pacpeek
pkgver=0.1.0
pkgrel=1
pkgdesc="A small CLI tool that is completely unnecessary, but way cooler than pacman -Qi"
arch=('x86_64')
url="https://github.com/RustyWaffle/pacpeek"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RustyWaffle/pacpeek/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('80fd4ad0a89021d969e011474ed7524e08453dfc1a87ba9ef703448d30310677')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
