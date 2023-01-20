# Maintainer: tjbp (archlinux@tjbp.net)
# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>
# Contributor: Erik Bročko <erik.brocko@letemsvetemapplem.eu>

pkgname='csdr'
pkgver='0.18.1'
pkgrel='1'
pkgdesc="A simple DSP library and command-line tool for Software Defined Radio"
arch=('i686' 'x86_64')
url='https://github.com/jketterl/csdr'
license=('GPL')
depends=('fftw')
makedepends=('cmake')
source=("https://github.com/jketterl/csdr/archive/$pkgver.tar.gz")
sha256sums=('ae06459e03e146af83f17cd403645d4149db2cce9c288f9ad2da92e8ebed009d')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    make DESTDIR="$pkgdir/" install
}
