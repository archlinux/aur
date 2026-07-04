pkgname=minesweeper
pkgver=1.1
pkgrel=1
pkgdesc="A simple Minesweeper game"
arch=('x86_64')
url="https://github.com/yu34567890/minesweeper-c"
license=('MIT')

depends=('glibc')
makedepends=('gcc')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/yu34567890/minesweeper-c/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b0acb77d368762dd5cdabd83f86a5ba9c8fe7f539cdf84b0637211ae2c414564')

build() {
    cd "${srcdir}/minesweeper-c-${pkgver}"
    gcc -O2 -o minesweeper main.c
}

package() {
    cd "${srcdir}/minesweeper-c-${pkgver}"
    install -Dm755 minesweeper "$pkgdir/usr/bin/minesweeper"
}
