# Maintainer: tho <basedtho at gmail dot com>

pkgname=finalcut-git
pkgver=0.6.0.5a60794
pkgrel=1
pkgdesc="A text-based widget toolkit."
arch=('x86_64')
url="https://github.com/gansm/finalcut"
license=('LGPL3')
depends=('gpm')
makedepends=('autoconf-archive' 'git')
provides=('finalcut')
source=("$pkgname::git+${url}.git")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname"

    autoreconf -if
    ./configure --prefix=/usr
}

build() {
    cd "$pkgname"
    make
}

check() {
    cd "$pkgname"
    make check
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir/" install
}

# vim: set softtabstop=4 shiftwidth=4 expandtab:

