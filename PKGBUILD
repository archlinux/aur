# Maintainer: nakidai

pkgname=mycfetch
pkgdesc="Small neofetch in C"
url="https://github.com/nakidai/mycfetch"
license=("BSD-2-Clause")

pkgver=1.4.1
pkgrel=2

arch=("x86_64")
depends=("glibc")
makedepends=("gcc")

source=("$pkgname-$pkgver.tar.gz::https://github.com/nakidai/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('fdd1d56511fe21fb607d9b16b6f5c4aa853de8429af51b9bbf9a396e2401a849')

build() {
    cd "$pkgname-$pkgver"
    make clean all
}
package() {
    cd "$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
    make PREFIX="$pkgdir/usr/" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
