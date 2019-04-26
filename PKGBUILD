# Maintainer: Andrea Orru <andrea at orru.io>

pkgname=asar-git
pkgver=v1.71.r16.g3d81cdf
pkgrel=1
pkgdesc="SNES assembler for applying patches to existing ROMs or creating new ROMs from scratch"
arch=('i686' 'x86_64')
url='https://github.com/RPGHacker/asar'
license=('LGPL3')
makedepends=('cmake' 'git')
source=("git://github.com/RPGHacker/asar.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/asar"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/asar"
    cmake src
    make
}

package() {
    cd "$srcdir/asar"
    install -Dm755 "$srcdir/asar/asar/asar-standalone" "$pkgdir/usr/bin/asar"
}
