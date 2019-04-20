# Maintainer: David Adler <d.adler@posteo.de>
pkgname=nl-filter
pkgver=0.1.0
pkgrel=3
pkgdesc="LADSPA implementation of the Dobson-Ffitch non-linear filter"
arch=('x86_64')
url="http://www.skynet.ie/~jmmcd/development.html"
license=('GPL')
depends=('glibc')
makedepends=('ladspa')
options=(!libtool)
source=($pkgname-$pkgver.tar.gz::http://www.skynet.ie/~jmmcd/software/$pkgname.tar.gz)
                                        
md5sums=('0d6211f4b802b29317b068951dece2e7')

build() {
    cd $pkgname-$pkgver
    ./configure --prefix=/usr
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir/" install
}

