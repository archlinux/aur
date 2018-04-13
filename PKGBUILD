# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-sparse
_pkgname=sparse
pkgver=0.3.1
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
sha256sums=('6c16f0c7d375ec1f41596e1cafd0fdd051affb0359b0e4f60a8b35361dcd347d')

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
