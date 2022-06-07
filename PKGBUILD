# SDR++ module for demodulating TETRA
# Maintainer: cropinghigh <joinmark60@gmail.com>
# Author: cropinghigh
pkgname=sdrpp-tetra-demodulator-git
pkgver=r3.cd4f183
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="SDR++ module for demodulating TETRA"
license=('GPL')
depends=('sdrpp-git' 'sdrpp-headers-git')
makedepends=('git' 'cmake' 'make')
provides=('sdrpp-tetra-demodulator')
conflicts=('sdrpp-tetra-demodulator')
source=("git+https://github.com/cropinghigh/sdrpp-tetra-demodulator")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/sdrpp-tetra-demodulator"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/sdrpp-tetra-demodulator"
    mkdir build
    cd build
    cmake ..
    make
}

package() {
    cd "$srcdir/sdrpp-tetra-demodulator/build"
    make DESTDIR=$pkgdir install
}
