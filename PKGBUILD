# Maintainer: Carson Rueter <roachh@protonmail.com>

_pkgname='passmanpp'
pkgname='passman++'
pkgdesc='Incredibly simple and secure command-line password manager.'
url="https://github.com/binex-dsk/$_pkgname/"
license=('BSD')
pkgver=1.1.0
pkgrel=1
source=("https://github.com/binex-dsk/$_pkgname/archive/$pkgver.zip")
md5sums=('6191151651c0f1d5939b7097d485fa7c')
provides=('passman')
conflicts=('passman-git')
depends=('botan' 'libsodium' 'qt5-base')
arch=('x86_64')

build() {
    cd "$srcdir/$_pkgname-$pkgver/src"
    qmake passman.pro
    make && make clean
}

package() {
    cd "$srcdir/$_pkgname-$pkgver/src"
    install -Dm755 passman $pkgdir/usr/bin/passman
}

