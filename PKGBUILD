# Maintainer: Carson Rueter <roachh@protonmail.com>

_pkgname='passmanpp'
pkgname='passman++'
pkgdesc='Incredibly simple and secure command-line password manager'
url="https://github.com/binex-dsk/$_pkgname/"
license=('GPL')
pkgver=2.1.0
pkgrel=2
source=("https://github.com/binex-dsk/$_pkgname/archive/$pkgver.tar.gz")
md5sums=('c4129adfd5a1414967df049eba82c47d')
provides=('passman')
conflicts=('passman-git' 'passman++-devel' 'passman++-lts')
depends=('botan' 'qt6-base')
arch=('x86_64')

build() {
    cd $srcdir/$_pkgname-$pkgver
    cmake -S . -B build -DCMAKE_INSTALL_BINDIR="/usr/bin/" -DCMAKE_INSTALL_DATAROOTDIR="/usr/share/"
    cmake --build build
}

package() {
    cd $srcdir/$_pkgname-$pkgver
    cmake --build build --target install -- DESTDIR="$pkgdir"
}

