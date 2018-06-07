# Maintainer: Ekin Dursun <ekindursun@gmail.com>
# Contributor: Oliver Mangold omangold at gmail dot com

pkgbase=python-spark-parser
pkgname=('python-spark-parser' 'python2-spark-parser')
pkgver=1.8.7
pkgrel=3
pkgdesc="An Early-Algorithm Context-free grammar Parser"
arch=('any')
url="https://github.com/rocky/python-spark/"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
_name='spark_parser'
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('4c5e6064afbb3c114749016d585b0e4f9222d4ffa97a1854c9ab70b25783ef48')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package_python-spark-parser() {
    depends=('python-click')

    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir"
}

package_python2-spark-parser() {
    depends=('python2-click')

    cd "$srcdir/$_name-$pkgver"
    python2 setup.py install --root="$pkgdir"
    mv "$pkgdir/usr/bin/spark-parser-coverage" "$pkgdir/usr/bin/spark-parser-coverage2"
}
