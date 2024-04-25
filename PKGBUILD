# Maintainer: rpkak <rpkak@users.noreply.github.com>
pkgname='packcc'
pkgver=2.0.2
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
sha256sums=('b9bea7b2dee2a9bbc4d513a912b52d646556161a4f97e1074c9c9a509f2cc343')
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
