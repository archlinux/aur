# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>
pkgbase=python-arg
pkgname=(python-arg python2-arg)
pkgver=1.0.1
pkgrel=3
pkgdesc="A simple argument parser for Python"
arch=('any')
url="https://codeberg.org/maandree/python-arg"
license=('custom:ISC')
depends=()
makedepends=(python python2)
source=($pkgbase-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(4a48e68ccd1d3b48618204feb9c36744137934d515cc8f5bb98441552a72a00f)

build() {
    true
}

check() {
    cd "$srcdir/$pkgbase"
    make check PYTHON_MAJOR=3
    make check PYTHON_MAJOR=2
}

package_python-arg() {
    pkgdesc="A simple argument parser for Python (Python 3 module)"
    depends=(python)

    cd "$srcdir/$pkgbase"
    make DESTDIR="$pkgdir" PREFIX=/usr PYTHON_MAJOR=3 install
}

package_python2-arg() {
    pkgdesc="A simple argument parser for Python (Python 2 module)"
    depends=(python2)

    cd "$srcdir/$pkgbase"
    make DESTDIR="$pkgdir" PREFIX=/usr PYTHON_MAJOR=2 install
}
