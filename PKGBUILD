# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=scikit-sparse
pkgname=python-$_pyname
pkgver=0.3
pkgrel=1
pkgdesc=
url="https://pypi.python.org/pypi/$_pyname/"
depends=('python-scipy' 'suitesparse')
license=('GPL')
arch=('i686' 'x86_64')
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")
md5sums=('edd0f3eaed471fe53ca4b0c03acc4ab3')

build() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
