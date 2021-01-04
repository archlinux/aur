# Maintainer: Carson Rueter <roachh@protonmail.com>

_pkgname='passmanpp'
pkgname='passman++-devel'
pkgdesc='Incredibly simple and secure command-line password manager - development/debug release'
url="https://github.com/binex-dsk/$_pkgname/"
license=('BSD')
pkgver=2.0.0rc3
pkgrel=2
source=("https://github.com/binex-dsk/$_pkgname/archive/$pkgver.zip")
md5sums=('10459975532025e7110517032a4a27fc')
provides=('passman')
conflicts=('passman-git' 'passman++')
depends=('botan' 'libsodium' 'qt6-base')
arch=('x86_64')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    ./build.sh
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 passman $pkgdir/usr/bin/passman
}

