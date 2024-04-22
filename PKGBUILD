# Maintainer: rpkak <rpkak@users.noreply.github.com>
pkgname='packcc'
pkgver=2.0.0
pkgrel=1
epoch=
pkgdesc="A parser generator for C"
arch=('x86_64')
url="https://arithy.github.io/packcc/"
license=('MIT')
groups=()
depends=(glibc)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/arithy/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c436d0a733dc2d1763b364ff87bf528a52981e51b2f730442868c706dd8cbf65')
validpgpkeys=()

build() {
    cd "$pkgname-$pkgver/src"
    "${CC:-cc}" $CFLAGS -std=gnu89 -fsigned-char -Wall -Wextra -Wno-unused-parameter -Wno-overlength-strings -pedantic -DNDEBUG -c -o packcc.o packcc.c
    "${CC:-cc}" $LDFLAGS -std=gnu89 -fsigned-char -Wall -Wextra -Wno-unused-parameter -Wno-overlength-strings -pedantic -DNDEBUG -o packcc packcc.o
}

package() {
    install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 "$pkgname-$pkgver/src/packcc" "$pkgdir/usr/bin/packcc"
}
