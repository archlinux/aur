# Maintainer: Philippe Widmer <pw@earthwave.ch>

pkgname=circada
pkgver=0.5.1
pkgrel=1
pkgdesc='Console IRC client'
arch=('x86_64')
url="https://github.com/freanux/circada"
license=('GPL-3.0-or-later')
depends=(gnutls ncurses lua)
makedepends=(gcc make automake libtool git)
source=("git+https://github.com/freanux/$pkgname.git#commit=3c19081fc3710acce19deb6fb90fb8d3b5e9062a")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname"
    autoupdate -f
    autoreconf -if
}

build() {
    cd "$srcdir/$pkgname"
    ./configure --prefix=/usr
    make
}

check() {
    cd "$srcdir/$pkgname"
    make check
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir/" install
}
