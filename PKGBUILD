# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-partd
_pkgname=partd
pkgver=0.3.7
pkgrel=1
pkgdesc="Appendable key-value storage"
arch=('any')
url="http://github.com/mrocklin/partd/"
license=('BSD')
depends=('python' 'python-locket' 'python-toolz')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
optdepends=('python-pyzmq' 'python-numpy' 'python-pandas' 'python-blosc')
source=("https://github.com/dask/partd/archive/$pkgver.tar.gz")
sha256sums=('6fd2145330a6d35adbb3785628b4247db8cf1acca42b9618a4b0bff46d15c656')

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  export PYTHONPATH=build/lib
  py.test
}

build(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
