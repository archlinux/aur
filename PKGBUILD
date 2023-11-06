# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-simpy
_name=${pkgname#python-}
pkgver=4.1.0
pkgrel=1
pkgdesc="Event discrete, process based simulation for Python."
url="http://simpy.readthedocs.org/en/latest/"
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools-scm)
license=('MIT')
arch=('any')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('10eba423374fba31e374edd604c5896d075017b15a1edc56de187dec854e9b44')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
