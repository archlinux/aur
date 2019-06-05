# Maintainer: Nick Skelsey <nskelsey@gmail.com>
pkgname=monopticon
pkgver=0.1.0
pkgrel=1
pkgdesc="Ethernet traffic visualizer for zeek"
arch=('x86_64')
url="https://github.com/nskelsey/monopticon"
license=('GPL')
depends=("zeek-broker" "zeek" "magnum-git" "corrade-git" "magnum-integration" "imgui-src")
source=("src::git+https://github.com/nskelsey/monopticon")
md5sums=('SKIP')

build() {
    cd "$srcdir"
    mkdir -p build
    cd build
    cmake $srcdir/src
    make -j7
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir/" install
}
