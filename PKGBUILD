# Maintainer: Carson Rueter <roachh@protonmail.com>

pkgname='libpassman'
pkgdesc='Library for interacting with passman++ database files.'
url="https://github.com/binex-dsk/$pkgname/"
license=('GPL')
pkgver=2.2.0
pkgrel=1
source=("https://github.com/binex-dsk/$pkgname/archive/$pkgver.tar.gz")
md5sums=('3d8c92e22b095f44eac4b9cca64ab46f')
provides=('libpassman')
depends=('botan' 'qt6-base')
arch=('x86_64')

build() {
    cd $srcdir/$pkgname-$pkgver
    cmake -S . -B build -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    cd $srcdir/$pkgname-$pkgver
    cmake --build build --target install -- DESTDIR="$pkgdir"
}

