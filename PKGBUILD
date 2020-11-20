# Maintainer: tjbp (archlinux@tjbp.net)
# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>
# Contributor: Erik Bročko <erik.brocko@letemsvetemapplem.eu>

pkgname='csdr'
pkgver='0.17.0'
pkgrel='1'
pkgdesc="A simple DSP library and command-line tool for Software Defined Radio"
arch=('i686' 'x86_64')
url='https://github.com/jketterl/csdr'
license=('GPL')
depends=('fftw')
source=("https://github.com/jketterl/csdr/archive/$pkgver.tar.gz")
sha256sums=('4b2b48055458a9ab6edddb693d718750397b71a52ebae556fb65e50f44f40b2a')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    autoreconf -i
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
