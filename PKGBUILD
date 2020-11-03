# Maintainer: Carson Rueter <roachh@protonmail.com>

_pkgname='passmanpp'
pkgname='passman++'
pkgdesc='Incredibly simple and secure command-line password manager.'
url="https://github.com/binex-dsk/$_pkgname/"
license=('BSD')
pkgver=1.2.0
pkgrel=1
source=("https://github.com/binex-dsk/$_pkgname/archive/$pkgver.zip")
md5sums=('bc5b28c9e9d61dd25839fea31c1a504d')
provides=('passman')
conflicts=('passman-git')
depends=('botan' 'libsodium' 'qt5-base' 'ttf-hack')
arch=('x86_64')

build() {
    cd "$srcdir/$_pkgname-$pkgver/src"
    qmake passman.pro
    make && make clean
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd "src"
    install -Dm755 passman $pkgdir/usr/bin/passman
}

