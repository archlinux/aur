# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
pkgname=pazi
pkgver=0.2.0
pkgrel=1
pkgdesc="An autojump 'zap to directory' helper"
url="https://github.com/euank/pazi"
arch=("x86_64")
license=("MIT")
makedepends=("rust")
source=("https://github.com/euank/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('04194bfdff78389fe7808fbbbcacb0eb2dbd47261360d2120269a4717c286563b62ca0d13c807bca90d7021a718da8de8a0342e27177d4775101f3b4cf30f9de')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
