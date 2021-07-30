# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=dotacat
pkgver=0.2.0
pkgrel=2
pkgdesc="Like lolcat, but faster. Written in Rust"
arch=('x86_64')
url="https://gitlab.scd31.com/stephen/dotacat"
license=('MIT')
makedepends=('cargo')
provides=('dotacat')
# conflicts=('dotacat-bin')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('26ceaf641b34f1676e06223640783807e3f6c3dd617ec09f3a0b4c770bca8ff1')

build() {
    cd "$srcdir/dotacat-v$pkgver"
    cargo build --release --locked
}

package() {
    cd "$srcdir/dotacat-v$pkgver"

    install -Dm 755 "target/release/dotacat"  "$pkgdir/usr/bin/dotacat"
    install -Dm 644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
