# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
pkgname=genact
pkgver=0.6.0
pkgrel=1
pkgdesc="A nonsense activity generator"
url="https://github.com/svenstaro/genact"
arch=("x86_64")
license=("MIT")
makedepends=("rust")
source=("https://github.com/svenstaro/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('7cc21e019d63c448b5c70bf66cca82852910da59759f18058f479d7cf473e6f1f5e46f5c36634c8d6d661dfb0ca049a9791c1406fb98984c27ab4ef7f86b315a')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
