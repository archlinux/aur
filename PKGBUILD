# Maintainer: Nick Skelsey <nskelsey@gmail.com>
pkgname=monopticon
pkgver=0.3.4
pkgrel=2
pkgdesc="Ethernet traffic visualizer for zeek"
arch=('x86_64')
url="https://github.com/nskelsey/monopticon"
license=('GPL')
depends=("zeek-broker" "zeek" "magnum-git" "corrade-git" "magnum-integration" "magnum-plugins-git")
source=("git+https://github.com/nskelsey/monopticon")
md5sums=('SKIP')

build() {
    cd "$srcdir/monopticon"
    mkdir -p build
    cd build
    cmake $srcdir/monopticon
    make
}

package() {
    cd "$srcdir/monopticon/build"
    make DESTDIR="$pkgdir/" install
}
