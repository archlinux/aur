# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
pkgname=pazi
pkgver=0.4.1
pkgrel=1
pkgdesc="An autojump 'zap to directory' helper"
url="https://github.com/euank/pazi"
arch=("x86_64")
license=("MIT")
makedepends=("rust")
source=("https://github.com/euank/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('87fc3d7af705809bf162ad80ea6472c7c48dddd6aee42092664b40a8026f5537c03b34b963f487bc5aba156dcb892785ee3c58f89453b768ae38b0bedea8a26e')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
