# Maintainer: nakidai

pkgname=mycfetch
pkgdesc="Small neofetch in C"
url="https://git.nakidai.ru/nakidai/mycfetch"
license=("BSD-2-Clause")

pkgver=1.4.1
pkgrel=1

arch=("x86_64")
depends=("glibc")
makedepends=("gcc")

source=("$pkgname-$pkgver.tar.gz::https://git.nakidai.ru/nakidai/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('8e05398ccf40e32a405fab68eb2c9e5ab2ef1c106ac687b0e9535b0e162c37ca')

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
