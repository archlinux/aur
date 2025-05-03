# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=cptutils
pkgver=1.84
pkgrel=1
pkgdesc='A number of utilities for the manipulation of color gradients; mainly for translating between different formats'
arch=('x86_64' 'aarch64')
url='http://soliton.vm.bytemark.co.uk/pub/jjg/en/code/cptutils/'
license=('GPL')
depends=('libxml2' 'libpng' 'jansson')
optdepends=('python: for the gradient-convert tool')

source=("https://jjg.gitlab.io/src/$pkgname-$pkgver.tar.gz")
sha256sums=('c3b7247271bc738da63d642bec3f977aaf7ededbde65fbb2b39627325b997acd')

build() {
    cd $pkgname-$pkgver
    ./configure --prefix=/usr
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
