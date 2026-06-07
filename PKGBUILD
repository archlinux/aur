# Maintainer: Daniil Mikhailov <danok123danok@gmail.com>
pkgname=ldpl
pkgver=5.1.0
pkgrel=1
pkgdesc="A compiled programming language designed to be plain and readable."
arch=('x86_64')
url="https://ldpl-lang.org"
license=('Apache-2.0')
depends=()
makedepends=('git' 'gcc')
source=("https://github.com/Lartu/ldpl/archive/refs/tags/LDPL-5.1.0.tar.gz")
md5sums=('SKIP')

build() {
    cd "$srcdir/ldpl-LDPL-5.1.0"
    make PREFIX="/usr"
}

package() {
    cd "$srcdir/ldpl-LDPL-5.1.0"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/man/man1"
    mkdir -p "$pkgdir/usr/lib/ldpl"
    cp build/ldpl "$pkgdir/usr/bin/ldpl"
    cp man/ldpl.1 "$pkgdir/usr/share/man/man1/ldpl.1"
    cp src/ldpl_lib/ldpl_lib.cpp "$pkgdir/usr/lib/ldpl/ldpl_lib.cpp"
    cp src/ldpl_lib/BigInt.hpp "$pkgdir/usr/lib/ldpl/BigInt.hpp"
    chmod 755 "$pkgdir/usr/bin/ldpl"
    chmod 755 "$pkgdir/usr/share/man/man1/ldpl.1"
    chmod 755 "$pkgdir/usr/lib/ldpl/ldpl_lib.cpp"
    chmod 755 "$pkgdir/usr/lib/ldpl/BigInt.hpp"
}
