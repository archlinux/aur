# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-simpy
_name=${pkgname#python-}
pkgver=4.1.1
pkgrel=3
pkgdesc="Event discrete, process based simulation for Python."
url="http://simpy.readthedocs.org/en/latest/"
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools-scm)
license=('MIT')
arch=('any')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('06d0750a7884b11e0e8e20ce0bc7c6d4ed5f1743d456695340d13fdff95001a6')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
