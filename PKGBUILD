# Stdcdec program to demodulate, decode and parse Inmarsat-C signals
# Maintainer: cropinghigh <joinmark60@gmail.com>
pkgname=stdcdec-git
pkgver=r11.c9a1689
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Stdcdec program to demodulate, decode and parse Inmarsat-C signals"
license=('GPL')
depends=("libinmarsatc")
provides=("stdcdec")
source=("git+https://github.com/cropinghigh/stdcdec")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/stdcdec"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $srcdir/stdcdec
    mkdir build
    cd build
    cmake ..
    make
}

package() {
    cd $srcdir/stdcdec/build
    make DESTDIR="$pkgdir/" install
}
