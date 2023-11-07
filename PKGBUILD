# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=cptutils
pkgver=1.78
pkgrel=1
pkgdesc='A number of utilities for the manipulation of color gradients; mainly for translating between different formats'
arch=('x86_64' 'aarch64')
url='http://soliton.vm.bytemark.co.uk/pub/jjg/en/code/cptutils/'
license=('GPL')
depends=('libxml2' 'libpng' 'jansson')
optdepends=('python: for the gradient-convert tool')

source=("http://soliton.vm.bytemark.co.uk/pub/jjg/src/$pkgname-$pkgver.tar.gz")
sha256sums=('a8c0a4cb3ee5790ae09f8d1009100ab417e1ee4dae420baa96961078b11ae78b')

build() {
    cd $pkgname-$pkgver
    ./configure --prefix=/usr
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
