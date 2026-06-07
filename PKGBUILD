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
    make
}

package() {
    cd "$srcdir/ldpl-LDPL-5.1.0"
    install -d "$pkgdir/usr/bin/"
    install -d "$pkgdir/usr/lib/ldpl/"
    install -m 755 build/ldpl "$pkgdir/usr/bin/ldpl"
    install src/ldpl_lib/ldpl_lib.cpp "$pkgdir/usr/lib/ldpl/"
    install src/ldpl_lib/BigInt.hpp "$pkgdir/usr/lib/ldpl/"
}

