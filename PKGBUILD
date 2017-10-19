# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>
pkgbase=python-arg
pkgname=(python-arg python2-arg)
pkgver=1.0
pkgrel=1
pkgdesc="A simple argument parser for Python"
arch=('any')
url="https://github.com/maandree/python-arg"
license=('custom:ISC')
depends=()
makedepends=(python python2)
source=($pkgbase-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(82798506f939e3109e33e92186865b88800d78c28a42fc2fb6038ec7a4b79a25)

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
