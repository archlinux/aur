# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-mysqlclient
_libname=${pkgname/python-/}
pkgver=1.3.11
pkgrel=1
pkgdesc="Fork of MySQL-python with support for Python 3"
arch=('i686' 'x86_64')
url="https://github.com/PyMySQL/mysqlclient-python"
license=('GPL')
depends=('python' 'libmariadbclient')
makedepends=('mariadb' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.tar.gz")

build() {
    cd "$srcdir"/$_libname-$pkgver
    python setup.py build
}

package() {
    cd "$srcdir"/$_libname-$pkgver
    python setup.py install -O1 --skip-build --root="$pkgdir"
}

sha256sums=('9a79b38843d61f651266ff16b9fdcc8830d21f0fb852e4406a19e9a715bdf3e2')
