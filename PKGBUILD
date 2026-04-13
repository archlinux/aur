# Maintainer: Ming Li <me@hihusky.com>
pkgname=termus
pkgver=1.0.4
pkgrel=1
pkgdesc="Small, fast terminal music player"
arch=('x86_64')
url="https://github.com/ming2k/termus"
license=('GPL3')
depends=('ncurses' 'glibc')
makedepends=('git' 'autoconf' 'automake' 'make' 'pkg-config' 'gcc')
source=("git+https://github.com/ming2k/termus.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname"
    autoreconf --force --install --verbose
}

build() {
    cd "$pkgname"
    mkdir -p build
    cd build
    ../configure --prefix=/usr
    make
}

package() {
    cd "$pkgname/build"
    make DESTDIR="$pkgdir" install
}
