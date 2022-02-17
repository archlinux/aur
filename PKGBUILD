#Maintainer: Illia Shestakov <illia@ishestakov.com>

pkgname=ncdu2
pkgver=2.1
_pkgver=${pkgver/beta/-beta}
pkgrel=1
pkgdesc="Disk usage analyzer with an ncurses interface. Rewrite in Zig."
arch=("i686" "x86_64")
url="https://dev.yorhel.nl/ncdu"
license=('MIT')
depends=("ncurses")
makedepends=("zig" "make")
source=("https://dev.yorhel.nl/download/ncdu-${_pkgver}.tar.gz")
sha512sums=("965317c0c645d2adfce80b70581cc2d0d6e6ac9af6fc2e2254676267c91958ebace886559a45e33ea1ef5bc5b227227caccf68d27c1293168ebab65d4db28083")

build() {
    cd "${srcdir}/ncdu-${_pkgver}"

    make
}

package() {
    cd "${srcdir}/ncdu-${_pkgver}"

    install -Dm755 zig-out/bin/ncdu "${pkgdir}/usr/bin/ncdu2"
}
