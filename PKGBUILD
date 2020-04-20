# Maintainer: Matteo De Carlo matteo [dot] dek [at] gmail [dot] com
pkgname=libdlibxx
_srcname="$pkgname"
pkgver=1.1.0
_srctag="v${pkgver}"
pkgrel=1
pkgdesc="A generalized C++ wrapper around the POSIX dynamic libraries functions dlopen, dlsym, dlclose, etc."
arch=('x86_64')
url="https://github.com/m-renaud/libdlibxx"
license=('BSD 2-Clause')
makedepends=('git')
source=("$_srcname::git+https://github.com/m-renaud/libdlibxx.git#tag=$_srctag")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/${_srcname}"
    mkdir -p build
    cd build
    cmake -D CMAKE_INSTALL_PREFIX="$pkgdir/usr" ..
}

build() {
    cd "$srcdir/${_srcname}"
    cd build
    make
}

package() {
    cd "$srcdir/${_srcname}"
    cd build
    make install
}
