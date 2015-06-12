# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=python2-pymix
_pkgname=pymix
pkgver=0.8a
pkgrel=1
pkgdesc="Data mining applications with basic and extended mixture model"
arch=('i686' 'x86_64')
url="http://www.pymix.org/pymix/"
license=('GPL')
depends=('python2-numpy')
makedepends=('python2-distribute')
source=("http://www.pymix.org/pymix-$pkgver.tar.gz" setup.patch)
md5sums=('4e2b7db99251d9ce6d0527528224a45b'
         '8ece81a85bff5443f7d0abd3d9414a25')

prepare() {
    cd "$srcdir/$_pkgname-$pkgver"
    patch -p0 < ../setup.patch
}

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python2 setup.py install --skip-build --prefix="/usr" --root="$pkgdir" --optimize=1
}

