pkgname=python-time-machine
_pkgname=${pkgname:7}
pkgver=2.8.1
pkgrel=1
pkgdesc="Travel through time in your tests."
arch=(any)
url="https://github.com/adamchainz/time-machine"
license=(MIT)
depends=(python-coverage python-pytest-randomly python-dateutil)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('4779029fa192fc36f782c1032a44be76ce8b75b1f0b7ec746647cb950b620bb7')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
