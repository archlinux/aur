# Maintainer: rpkak <rpkak@users.noreply.github.com>
pkgname='packcc'
pkgver=1.8.0
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
sha256sums=('811516f71196958a6e5b22755951ea0d48e09e948e1b75dd86af19923aae2947')
validpgpkeys=()

build() {
    cd "$pkgname-$pkgver/src"
    "${CC:-cc}" $CFLAGS -c -o packcc.o packcc.c
    "${CC:-cc}" $LDFLAGS -o packcc packcc.o
}

package() {
    install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 "$pkgname-$pkgver/src/packcc" "$pkgdir/usr/bin/packcc"
}
