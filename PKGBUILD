pkgname=python-pytest-random-order
_pkgname=${pkgname:7}
pkgver=1.0.4
pkgrel=1
pkgdesc="Randomise the order in which pytest tests are run with some control over the randomness"
arch=(any)
url="https://github.com/jbasko/pytest-random-orderl"
license=(MIT)
depends=(python-coverage python-py python-pytest python-pytest-xdist python-sphinx python-tox)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('6b2159342a4c8c10855bc4fc6d65ee890fc614cb2b4ff688979b008a82a0ff52')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
