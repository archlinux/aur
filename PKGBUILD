# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=genact
pkgver=0.5.0
pkgrel=1
pkgdesc="A nonsense activity generator"
url="https://github.com/svenstaro/genact"
arch=("x86_64")
license=("MIT")
makedepends=("rust")
source=("https://github.com/svenstaro/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('1b68ac7e03f0248a8ca69d1079f4af4908622b5e5cf0cf3cdbfd5621e5671ed59a1e86fe26b4550fdc495727769b74d463f81fcc402104c82e35eb3e5b5e29fa')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
