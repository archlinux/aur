# Stdcdec program to demodulate, decode and parse Inmarsat-C signals
# Maintainer: cropinghigh <joinmark60@gmail.com>
pkgname=stdcdec-git
pkgver=1.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Stdcdec program to demodulate, decode and parse Inmarsat-C signals"
license=('GPL')
depends=("libinmarsatc")
provides=("stdcdec")
source=("git://github.com/cropinghigh/stdcdec")
md5sums=('SKIP')

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
