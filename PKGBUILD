pkgname=minesweeper
pkgver=1.2
pkgrel=1
pkgdesc="A simple Minesweeper game"
arch=('x86_64')
url="https://github.com/yu34567890/minesweeper-c"
license=('MIT')

depends=('glibc')
makedepends=('gcc')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/yu34567890/minesweeper-c/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b56575a2dc8ecf20203aff1f7281c5a2eb39feb5f93d592a2751f59c9f94cd50')

build() {
    cd "${srcdir}/minesweeper-c-${pkgver}"
    gcc -O2 -o minesweeper main.c
}

package() {
    cd "${srcdir}/minesweeper-c-${pkgver}"
    install -Dm755 minesweeper "$pkgdir/usr/bin/minesweeper"
}
