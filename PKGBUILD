#!/hint/bash
# Maintainer: Michael Bolden Jnr / SM9(); <me@sm9.dev>

pkgname=glaze
pkgver=1.4.1
pkgrel=1
pkgdesc="A High-Performance, In-Memory JSON and Interface Library for Modern C++"
arch=('any')
url="https://github.com/stephenberry/glaze"
license=('MIT')
makedepends=('git' 'cmake')
optdepends=('gcc' 'clang')
provides=("$pkgname")
source=("git+${url}.git#tag=v$pkgver")
sha512sums=('SKIP')

build() {
    cd "$srcdir/$pkgname" || exit
    mkdir -p build
    cd build || exit

    cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
        -DCMAKE_VERBOSE_MAKEFILE=ON \
        -DCMAKE_BUILD_TYPE=Release ..
    make
}

package() {
    cd "$pkgname/build"
    make install
}
