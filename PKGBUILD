# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-simpy
_name=${pkgname#python-}
pkgver=4.0.2
pkgrel=1
pkgdesc="Event discrete, process based simulation for Python."
url="http://simpy.readthedocs.org/en/latest/"
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools-scm)
license=('MIT')
arch=('any')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('6d8adc0229df6b02fb7e26dcd1338703b4f4f63f167a5ac2a7213cb80aba4484')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
