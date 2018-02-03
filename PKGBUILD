# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=genact
pkgver=0.4.0
pkgrel=1
pkgdesc="A nonsense activity generator"
url="https://github.com/svenstaro/genact"
arch=("x86_64")
license=("MIT")
makedepends=("rust")
source=("https://github.com/svenstaro/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('4106c8ff6b5f7fb0239e85ac354acb9abdd2a0b87a6cfdd2facde17ad711e8976c01f07ed64fa531f4675b66f54721872efca6112416d805d2d855abc6512a8a')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
