# Maintainer: Florian Knodt <arch at adlerweb d info>

pkgname=batman-alfred-json-git
pkgver=88
pkgrel=1
pkgdesc='Simple alfred client with JSON output'
arch=('i686' 'x86_64')
url="https://github.com/tcatm/alfred-json"
depends=('jansson' 'zlib')
optdepends=('batman-alfred: Local alfred server')
makedepends=('git' 'cmake')
source=("git://github.com/tcatm/alfred-json")
md5sums=('SKIP')
license=('GPL2')

pkgver() {
    cd "$srcdir/alfred-json"
    git rev-list HEAD --count
}

build() {
    cd "$srcdir/alfred-json"
    mkdir build
    cd build
    cmake ../ -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$srcdir/alfred-json/build"
    make DESTDIR="$pkgdir" install
}
