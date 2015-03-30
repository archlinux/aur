# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-mysqlclient
_libname=${pkgname/python-/}
pkgver=1.3.6
pkgrel=1
pkgdesc="Fork of MySQL-python with support for Python 3"
arch=('i686' 'x86_64')
url="https://github.com/PyMySQL/mysqlclient-python"
license=('GPL')
depends=('python' 'libmariadbclient')
makedepends=('mariadb' 'python-setuptools')
source=("http://pypi.python.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.tar.gz")

build() {
    cd "$srcdir"/$_libname-$pkgver
    python setup.py build
}

package() {
    cd "$srcdir"/$_libname-$pkgver
    python setup.py install -O1 --skip-build --root="$pkgdir"
}

sha256sums=('1f63a8ab111530a0ff9acaeb118074f11e7564b7c124f2e7fc56fcac641aecf2')
