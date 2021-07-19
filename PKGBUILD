# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=choose
pkgver=1.3.2
pkgrel=1
pkgdesc="A human-friendly and fast alternative to cut and (sometimes) awk"
arch=('x86_64')
url="https://github.com/theryangeary/choose"
license=('GPL3')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a2970b1e515ab77e1c9e976bb0c7e6bcd93afb992eba532c5d23c972c0971ff3')

build() {
    cd $pkgname-$pkgver
    cargo build --release --locked
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 readme.md -t "$pkgdir/usr/share/doc/$pkgname"
}
