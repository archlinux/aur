# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=cptutils
pkgver=1.77
pkgrel=1
pkgdesc='A number of utilities for the manipulation of color gradients; mainly for translating between different formats'
arch=('x86_64' 'aarch64')
url='http://soliton.vm.bytemark.co.uk/pub/jjg/en/code/cptutils.html'
license=('GPL')
depends=('libxml2' 'libpng' 'jansson')
optdepends=('python: for the gradient-convert tool')

source=("http://soliton.vm.bytemark.co.uk/pub/jjg/src/$pkgname-$pkgver.tar.gz")
sha256sums=('cdef49a363178617df2983455a174d7dbb248d26572ff5f11f86419843c3ebff')

build() {
    cd $pkgname-$pkgver
    ./configure --prefix=/usr
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
