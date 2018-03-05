# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-sparse
_pkgname=sparse
pkgver=0.3.0
pkgrel=1
pkgdesc="Sparse multidimensional arrays on top of numpy and scipy"
arch=('any')
url="https://sparse.pydata.org"
license=('BSD')
depends=('python' 'python-numpy' 'python-scipy')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-flake8')
optdepends=()
makedepends=('python-setuptools')
source=("https://github.com/pydata/sparse/archive/$pkgver.tar.gz")
sha256sums=('e1f099d4096f9b66308b8e890c9b96a96c90b7760598a9b484f1e728b8fe4e58')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  install -D -m644 LICENSE.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}

check(){
  cd "$srcdir/$_pkgname-$pkgver"
  py.test
}
# vim:ts=2:sw=2:et:
