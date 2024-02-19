# Maintainer: nakidai

pkgname=mycfetch
pkgdesc="Small neofetch in C"
url="https://git.nakidai.ru/nakidai/mycfetch"
license=("BSD-2-Clause")

pkgver=1.1
pkgrel=1

arch=("x86_64")
depends=("glibc")
makedepends=("gcc")

source=("https://git.nakidai.ru/nakidai/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('78ef8bc03714af31c46669969344e0b00a2c3d2e99a64ed686ed9cd445eeab70')

build() {
    cd "$pkgname"
    make
}
package() {
    cd "$pkgname"
    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
    make PREFIX="$pkgdir/usr/" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
