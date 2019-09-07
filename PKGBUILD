# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=optionmatrix
pkgver=1.4.3
pkgrel=1
pkgdesc="A financial derivative calculator with 168+ models"
arch=("x86_64")
url="https://sourceforge.net/projects/optionmatrix"
license=('GPL')
depends=('gtk3' 'gsl')
makedepends=('texlive-core')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('8dc04f9a8086ffd3aaa2b386f0cfb05ad69b651d8b6b926880325a78a3bba0fd')

build() {
    cd $pkgname-$pkgver
    ./configure --prefix=/usr
    make
}

check() {
    cd $pkgname-$pkgver
    make -k check
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR=$pkgdir install
}
