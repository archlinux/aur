# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python2-pymix
_pkgname=pymix
pkgver=0.8b
pkgrel=1
pkgdesc="Data mining applications with basic and extended mixture model"
arch=('i686' 'x86_64')
url="http://www.pymix.org/pymix/"
license=('GPL')
depends=('python2-numpy')
makedepends=('python2-distribute')
source=("https://pypi.io/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
        "setup.patch")
md5sums=('ca2d1b8231c9883389b0513b0e19014d'
         '998f9ba98f9217779fbe76bc6cbc655e')

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
