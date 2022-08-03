# Maintainer: Andrea Orru <andrea at orru.io>

pkgname=asar-git
pkgver=v1.81.r171.g634d6ba
pkgrel=1
pkgdesc='SNES assembler for applying patches to existing ROMs or creating new ROMs from scratch'
arch=('x86_64')
url='https://github.com/RPGHacker/asar'
license=('LGPL3')
makedepends=('cmake' 'git')
source=('git+https://github.com/RPGHacker/asar.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/asar"
    git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

build() {
    cd "$srcdir/asar"
    cmake src
    make
}

package() {
    cd "$srcdir/asar"
    install -Dm755 "$srcdir/asar/asar/bin/asar" "$pkgdir/usr/bin/asar"
}
