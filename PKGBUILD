# Maintainer: Carson Rueter <roachh@protonmail.com>

_pkgname='passmanpp'
pkgname='passman++-devel'
pkgdesc='Incredibly simple and secure command-line password manager - development/debug release'
url="https://github.com/binex-dsk/$_pkgname/"
license=('GPL')
pkgver=2.0.0
pkgrel=1
source=("https://github.com/binex-dsk/$_pkgname/archive/$pkgver.tar.gz")
md5sums=('22667201a3028a13d1e80dcca72b2547')
provides=('passman')
conflicts=('passman-git' 'passman++' 'passman++-lts')
depends=('botan' 'libsodium' 'qt6-base')
optdepends=('gnome-themes-extra: may be necessary for icons to work'
	    'breeze: recommended theme to use for passman++')
arch=('x86_64')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    ./build.sh
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    install -Dm755 passman $pkgdir/usr/bin/passman
}

