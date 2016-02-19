# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-partd
_pkgname=partd
pkgver=0.3.2
pkgrel=1
pkgdesc="Appendable key-value storage"
arch=('any')
url="http://github.com/mrocklin/partd/"
license=('BSD')
depends=('python' 'python-locket')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=(https://pypi.python.org/packages/source/p/partd/partd-$pkgver.tar.gz)
sha256sums=('0b8a2f313d07548ab5fbca89fae27d63ce81709ee544609b9e515d9c604ca910')

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  py.test
}


package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
