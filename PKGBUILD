# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
pkgname=genact
pkgver=0.7.0
pkgrel=1
pkgdesc="A nonsense activity generator"
url="https://github.com/svenstaro/genact"
arch=("x86_64")
license=("MIT")
makedepends=("rust")
source=("https://github.com/svenstaro/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('ecbcf4ae5434fcd1ec61dfd2677f734c7a2807e09114d4bdbfb1f95c968d1dc6763529d1b2ac5e9fa4f0d9bfc1892044e8cb25d931ff6ee671b25911e00527dc')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --locked
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
