# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=choose
pkgver=1.3.3
pkgrel=1
pkgdesc="A human-friendly and fast alternative to cut and (sometimes) awk"
arch=('x86_64')
url="https://github.com/theryangeary/choose"
license=('GPL3')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('336225a05d98e536f79969c2d1727c8371df3d289e4aebe15a1a476db0f84df2')

build() {
    cd $pkgname-$pkgver
    cargo build --release --locked
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 readme.md -t "$pkgdir/usr/share/doc/$pkgname"
}
