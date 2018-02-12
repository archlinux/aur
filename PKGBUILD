# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-sparse
_pkgname=sparse
pkgver=0.2.0
pkgrel=1
pkgdesc="Sparse multidimensional arrays on top of numpy and scipy"
arch=('any')
url="https://github.com/mrocklin/sparse"
license=('BSD')
depends=('python' 'python-numpy' 'python-scipy')
checkdepends=('python-pytest')
optdepends=()
makedepends=('python-setuptools')
source=("https://github.com/mrocklin/sparse/archive/$pkgver.tar.gz")
sha256sums=('11a506ca9b14ff974387b79f540045ddfc0d32043abe61b6bea4d1fa2c60d955')

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
