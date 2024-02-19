# Maintainer: nakidai

pkgname=mycfetch
pkgdesc="Small neofetch in C"
url="https://git.nakidai.ru/nakidai/mycfetch"
license=("BSD-2-Clause")

pkgver=1.0
pkgrel=1

arch=("x86_64")
depends=("glibc")
makedepends=("gcc")

source=("https://git.nakidai.ru/nakidai/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('0e0122efd7b30ada198a902cf11bfc42c6bcce7787b3814c8ad8a0de57df0b02')

build() {
    cd "$pkgname"
    make
}
package() {
    cd "$pkgname"
    echo $pkgdir
    mkdir -p "$pkgdir/bin/"
    make  PREFIX="$pkgdir" install
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
