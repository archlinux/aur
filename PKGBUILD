# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>
pkgbase=python-arg
pkgname=(python-arg python2-arg)
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple argument parser for Python"
arch=('any')
url="https://github.com/maandree/python-arg"
license=('custom:ISC')
depends=()
makedepends=(python python2)
source=($pkgbase-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(1f392bf5e671de0b68d93b5ce717ec658ff944b4c88a25b640db518e76a26ae5)

build() {
    true
}

check() {
    cd "$srcdir/$pkgbase-$pkgver"
    make check PYTHON_MAJOR=3
    make check PYTHON_MAJOR=2
}

package_python-arg() {
    cd "$srcdir/$pkgbase-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr PYTHON_MAJOR=3 install
}

package_python2-arg() {
    cd "$srcdir/$pkgbase-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr PYTHON_MAJOR=2 install
}
