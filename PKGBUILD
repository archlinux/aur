# Maintainer: Adrián Kálazi <adrian@kalazi.com>

pkgname=esearch
_pkgdirname="pacman-$pkgname"
pkgver=4.4.1
_gittag="v$pkgver"
pkgrel=1
pkgdesc="Replacement for pacman -Ss and pacman -Si"
arch=("x86_64")
url="https://github.com/KLZ-0/pacman-esearch"
license=("MIT")
makedepends=("git" "cmake" "gcc" "python")
provides=("esearch")
source=("git+https://github.com/KLZ-0/pacman-esearch#tag=${_gittag}")

md5sums=("SKIP")

pkgver() {
    cd "$srcdir/$_pkgdirname"
    echo $(grep "define VERSION" src/def.h | grep -E -o "[0-9\\.]+")
}

build() {
    cd "$srcdir/$_pkgdirname"
    make
}

package() {
    cd "$srcdir/$_pkgdirname"
    make DESTDIR="$pkgdir/" install
}
