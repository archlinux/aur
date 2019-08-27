# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='python-sparse'
_pkgname=sparse
pkgver=0.8.0
pkgrel=1
pkgdesc="Sparse multidimensional arrays on top of numpy and scipy"
arch=('any')
url="https://sparse.pydata.org"
license=('BSD-3-clause')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-flake8')
depends=('python' 'python-numpy' 'python-scipy' 'python-numba')
optdepends=()
makedepends=('python-setuptools')
source=("https://github.com/pydata/sparse/archive/$pkgver.tar.gz")
sha256sums=('879366b93a7033c20c5c5a16beb5d49cd8ed0634f8a73b387f9ccc46576bbd04')


package(){
  cd "$srcdir/$_pkgname-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}

check(){
  cd "$srcdir/$_pkgname-$pkgver"
  PYTHONPATH=. py.test sparse/tests
}
# vim:ts=2:sw=2:et:
