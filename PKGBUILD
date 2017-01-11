# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-mysqlclient
_libname=${pkgname/python-/}
pkgver=1.3.9
pkgrel=2
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

sha256sums=('990ccf1e1f15b9a291b811c993dc1c216566714bc14e6581b38665bd61c28c99')
