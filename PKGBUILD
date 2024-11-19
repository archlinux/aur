# Maintainer: Nakidai <nakidai at disroot dot org>
pkgname=getlayout
pkgdesc="Print current layout in Xorg"
url="https://git.nakidai.ru/nakidai/mycfetch"
license=("BSD-2-Clause")

pkgver=1.1
pkgrel=1

arch=("x86_64")
depends=("glibc")
makedepends=("gcc" "libx11" "libxkbfile")

source=("https://git.nakidai.ru/nakidai/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('9b892b973023796a61b2957cc681155d4b50c69007c33572d71582e00faa89e7')

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
