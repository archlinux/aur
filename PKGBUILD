# Maintainer: tjbp (archlinux@tjbp.net)
# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>
# Contributor: Erik Bročko <erik.brocko@letemsvetemapplem.eu>

pkgname='csdr'
pkgver='0.18.2'
pkgrel='1'
pkgdesc="A simple DSP library and command-line tool for Software Defined Radio"
arch=('i686' 'x86_64')
url='https://github.com/jketterl/csdr'
license=('GPL')
depends=('fftw')
makedepends=('cmake')
source=("https://github.com/jketterl/csdr/archive/$pkgver.tar.gz")
sha256sums=('70c55f6f3fd42042d4cc56ea100a08bb85b5fc8c60d4e4f596382c5275833468')

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
