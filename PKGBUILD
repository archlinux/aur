# Maintainer: Illia Shestakov <illia@ishestakov.com>

pkgname=ncdu2
pkgver=2.0
_pkgver2=beta1
pkgrel=1
pkgdesc="Disk usage analyzer with an ncurses interface. Rewrite in Zig."
arch=("i686" "x86_64")
url="https://dev.yorhel.nl/ncdu"
license=('MIT')
depends=("ncurses")
makedepends=("zig" "make")
source=("https://dev.yorhel.nl/download/ncdu-${pkgver}-${_pkgver2}.tar.gz")
sha512sums=("929447fbcf9e30d8c8de1991c9d68d1ddb6bc2c3f9bd45dca4af485b47ca8108bee0afd646975daa2cfb04770eeaa62f121a346b252bf1133b96d72339bea096")

build() {
    cd "${srcdir}/ncdu-${pkgver}-${_pkgver2}"

    make
}

package() {
    cd "${srcdir}/ncdu-${pkgver}-${_pkgver2}"

    install -Dm755 zig-out/bin/ncdu "${pkgdir}/usr/bin/ncdu2"
}
