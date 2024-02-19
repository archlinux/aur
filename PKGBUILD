# Maintainer: nakidai

pkgname=mycfetch
pkgdesc="Small neofetch in C"
url="https://git.nakidai.ru/nakidai/mycfetch"
license=("BSD-2-Clause")

pkgver=1.2
pkgrel=1

arch=("x86_64")
depends=("glibc")
makedepends=("gcc")

source=("https://git.nakidai.ru/nakidai/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('afd758df7330ff6a0ca17a7d021f7fed5746455f4861fcdd4520731dbaca6a1b')

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
