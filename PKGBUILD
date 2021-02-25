# Maintainer: Carson Rueter <roachh@protonmail.com>

_pkgname='passmanpp'
pkgname='passman++-devel'
pkgdesc='Incredibly simple and secure command-line password manager - development/debug release'
url="https://github.com/binex-dsk/$_pkgname/"
license=('GPL')
pkgver=2.0.1
pkgrel=1
source=("https://github.com/binex-dsk/$_pkgname/archive/$pkgver.tar.gz")
md5sums=('594a233a3219a6760e6e7614617d0fee')
provides=('passman')
conflicts=('passman-git' 'passman++' 'passman++-lts')
depends=('botan' 'qt6-base')
arch=('x86_64')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    ./build.sh
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    install -Dm755 passman $pkgdir/usr/bin/passman
}

