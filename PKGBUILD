pkgname=python-pytest-random-order
_pkgname=pytest_random_order
pkgver=1.2.0
pkgrel=1
pkgdesc="Randomise the order in which pytest tests are run with some control over the randomness"
arch=(any)
url="https://github.com/jbasko/pytest-random-order"
license=(MIT)
depends=(python python-pytest)
makedepends=(python-build python-installer python-setuptools-scm)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('12b2d4ee977ec9922b5e3575afe13c22cbdb06e3d03e550abc43df137b90439a')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
