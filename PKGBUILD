# Inmarsat-C library
# Maintainer: cropinghigh <joinmark60@gmail.com>
pkgname=libinmarsatc-git
pkgver=r13.31c6f5e
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Inmarsat-C Open-source library based on Scytale-c"
license=('GPL')
provides=("libinmarsatc")
source=("git+https://github.com/cropinghigh/inmarsatc")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/inmarsatc"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $srcdir/inmarsatc
    mkdir build
    cd build
    cmake ..
    make
}

package() {
    cd $srcdir/inmarsatc/build
    make DESTDIR="$pkgdir/" install
}
