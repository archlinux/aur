# Maintainer: nakidai
pkgname=getlayout
pkgdesc="Print current layout in Xorg"
url="https://git.nakidai.ru/nakidai/mycfetch"
license=("BSD-2-Clause")
pkgver=1.0
pkgrel=1
arch=("x86_64")
depends=("glibc")
makedepends=("gcc" "libx11" "libxkbfile")
source=("https://git.nakidai.ru/nakidai/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('a52a1370ac15e0824b735e0c3039fa972b2ab50303d91576349f4d8b563d6b52')
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
