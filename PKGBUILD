# Maintainer: Stefan Wimmer <info@stefanwimmer128.xyz>

_pkgname=getoptions
pkgname=$_pkgname-ng
pkgdesc="An elegant option/argument parser for shell scripts"
pkgver=1.1.0
pkgrel=1
arch=(any)
depends=(sh)
makedepends=(pandoc)
checkdepends=(shellcheck shellspec)
provides=($_pkgname)
conflicts=($_pkgname)
url="https://gitlab.com/stefanwimmer128/$pkgname"
license=(CC0-1.0)
source=("$url/-/releases/v$pkgver/downloads/$pkgname-v$pkgver.tar.gz")
sha256sums=('8da08c1e39ff8977d019c5eb2b3fbc4ba76a933b50cc63fd32d9f90829aa81bd')

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
