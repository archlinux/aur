# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-partd
_pkgname=partd
pkgver=0.3.4
pkgrel=1
pkgdesc="Appendable key-value storage"
arch=('any')
url="http://github.com/mrocklin/partd/"
license=('BSD')
depends=('python' 'python-locket')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=(https://pypi.python.org/packages/81/0b/e69d4e325a7b2d0cd5b6a7ff8f9c620c78c21d0f20d95718ff0caad71435/partd-$pkgver.tar.gz)
sha256sums=('7dce2e5e95c48d8da1b0ea05efcfff1150731e3f4081aecf9d5e8337a30ad24e')

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
