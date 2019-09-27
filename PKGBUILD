# Maintainer: ache <ache@ache.one>

pkgname=metag-git
pkgver=20190927
pkgrel=1
pkgdesc="Ncurses audio tag editor with support of regex"
arch=("any")
url="https://git.ache.one/metag"
license=('GPL3')
makedepends=('git' 'readline' 'taglib')
provides=("metag=${pkgver}")
source=("metag::git+https://git.ache.one/metag")

md5sums=('SKIP')

pkgver() {
    cd "$srcdir/metag"
    git log -1 --format='%cd' --date=short | tr -d -- '-'
}

build() {
    cd "$srcdir/metag"
    make
}

package() {
    cd "$srcdir/metag"
    install -Dm755 "metag" "$pkgdir/usr/bin/metag"
}

