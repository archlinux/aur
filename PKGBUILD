# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-sparse
_pkgname=sparse
pkgver=0.1.0
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
sha256sums=('64e87e328c3c4b02317390aa051647b9c37f4bc1d09d6e53d89fc39173896a56')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}

check(){
  cd "$srcdir/$_pkgname-$pkgver"
  PYTHONPATH=. py.test
}
# vim:ts=2:sw=2:et:
