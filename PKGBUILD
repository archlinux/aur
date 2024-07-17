# Maintainer: David Adler <d.adler@posteo.de>
pkgname=nl-filter
pkgver=0.1.0
pkgrel=4
pkgdesc="LADSPA implementation of the Dobson-Ffitch non-linear filter"
arch=('x86_64')
url="https://web.archive.org/web/20191019103758/http://www.skynet.ie/~jmmcd/development.html"
license=('GPL')
depends=('glibc')
makedepends=('ladspa')
options=(!libtool)
source=($pkgname-$pkgver.tar.gz::https://web.archive.org/web/20191019103758/http://www.skynet.ie/~jmmcd/software/nl-filter.tar.gz)
md5sums=('d12f3c6a65b23addc8714a63e5c6ca5f')
                                        

build() {
    cd $pkgname-$pkgver
    ./configure --prefix=/usr
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir/" install
}

