# Maintainer: Stefan Wimmer <info@stefanwimmer128.xyz>

_pkgname=getoptions
pkgname=$_pkgname-ng
pkgdesc="An elegant option/argument parser for shell scripts"
pkgver=1.0.0
pkgrel=1
arch=(any)
depends=(sh)
checkdepends=(shellcheck shellspec)
provides=($_pkgname)
conflicts=($_pkgname)
url="https://gitlab.com/stefanwimmer128/$pkgname"
license=(CC0-1.0)
source=("$url/-/releases/v$pkgver/downloads/$pkgname-v$pkgver.tar.gz")
sha256sums=('944681d1ead083da35b013522055d4aad28157e07ff1d6310f0c9365f35028d8')

prepare() {
    cd "$pkgname-v$pkgver" || return
    ./configure --prefix=/usr
}

build() {
    cd "$pkgname-v$pkgver" || return
    make
}

check() {
    cd "$pkgname-v$pkgver" || return
    make check
}

package() {
    cd "$pkgname-v$pkgver" || return
    make DESTDIR="$pkgdir" install
}
