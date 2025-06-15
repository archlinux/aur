# Maintainer: Nguyen Ky <nhktmdzhg at gmail dot com>
_pkgname="nmcurse"
pkgname="$_pkgname-nhk-git"
epoch=1
pkgver=latest
pkgrel=1
pkgdesc="Curses interface for NetworkManager, forked by nanoka"
arch=(x86_64 aarch64)
url="https://github.com/nhktmdzhg/$_pkgname"
depends=('networkmanager')
makedepends=('cmake' 'gcc' 'make' 'ncurses')
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')

build() {
    cd "$srcdir/${_pkgname}"
    mkdir -p build && cd build
    cmake ..
    make -j
}

package() {
    cd "$srcdir/${_pkgname}/build"
    make DESTDIR="$pkgdir" install
}

