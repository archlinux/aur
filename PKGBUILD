# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=genact
pkgver=0.3.2
pkgrel=1
pkgdesc="A nonsense activity generator"
url="https://github.com/svenstaro/genact"
arch=("x86_64")
license=("MIT")
makedepends=("rust")
source=("https://github.com/svenstaro/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('6d3dafe98b7dfc10e5604ff73db64fa89a35d54501ab14c27ae08f4954fca021c64b5f53f802ea7beed5c6af9372ec2ac783b161572bfd52c67f1127398dfec1')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
