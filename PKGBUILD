# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-partd
_pkgname=partd
pkgver=0.3.8
pkgrel=1
pkgdesc="Appendable key-value storage"
arch=('any')
url="http://github.com/mrocklin/partd/"
license=('BSD')
depends=('python' 'python-locket' 'python-toolz')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
optdepends=('python-pyzmq' 'python-numpy' 'python-pandas' 'python-blosc')
source=("https://pypi.python.org/packages/e7/0c/b257648852230acf169c60283e59475727b156ee1a0a3a6b5527af745f15/partd-0.3.8.tar.gz")
sha256sums=('67291f1c4827cde3e0148b3be5d69af64b6d6169feb9ba88f0a6cfe77089400f')

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
