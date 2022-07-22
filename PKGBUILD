# Maintainer: tjbp (archlinux@tjbp.net)
# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>
# Contributor: Erik Bročko <erik.brocko@letemsvetemapplem.eu>

pkgname='csdr'
pkgver='0.18.0'
pkgrel='1'
pkgdesc="A simple DSP library and command-line tool for Software Defined Radio"
arch=('i686' 'x86_64')
url='https://github.com/jketterl/csdr'
license=('GPL')
depends=('fftw')
source=("https://github.com/jketterl/csdr/archive/$pkgver.tar.gz")
sha256sums=('918e478fb6da10ecfb502e3867059b2e4cfb5d05c3dcb6919ecd065eac203814')

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
