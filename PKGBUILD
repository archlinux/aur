# Maintainer: Carson Rueter <roachh@protonmail.com>

_pkgname='passmanpp'
pkgname='passman++-devel'
pkgdesc='Incredibly simple and secure command-line password manager - development releases'
url="https://github.com/binex-dsk/$_pkgname/"
license=('GPL')
pkgver=2.1.1
pkgrel=1
source=("https://github.com/binex-dsk/$_pkgname/archive/$pkgver.tar.gz")
md5sums=('10875cba388b6502b5e6999280ad5c31')
provides=('passman')
conflicts=('passman-git' 'passman++' 'passman++-lts')
depends=('botan' 'qt6-base' 'libpassman')
arch=('x86_64')

build() {
    cd $srcdir/$_pkgname-$pkgver
    cmake -S . -B build -DCMAKE_INSTALL_PREFIX="/usr"
    cmake --build build
}

package() {
    cd $srcdir/$_pkgname-$pkgver
    cmake --build build --target install -- DESTDIR="$pkgdir"
}

