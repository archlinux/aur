# Maintainer: nakidai

pkgname=mycfetch
pkgdesc="Small neofetch in C"
url="https://git.nakidai.ru/nakidai/mycfetch"
license=("BSD-2-Clause")

pkgver=1.3
pkgrel=1

arch=("x86_64")
depends=("glibc")
makedepends=("gcc")

source=("$pkgname-$pkgver.tar.gz::https://git.nakidai.ru/nakidai/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('e21d3c1315e27a853afc9d4e5afd462585c7276a07f1548f124844995fae7c83')

build() {
    cd "$pkgname"
    make clean all
}
package() {
    cd "$pkgname"
    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
    make PREFIX="$pkgdir/usr/" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
