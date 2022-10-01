pkgname=python-time-machine
_pkgname=${pkgname:7}
pkgver=2.8.2
pkgrel=1
pkgdesc="Travel through time in your tests."
arch=(any)
url="https://github.com/adamchainz/time-machine"
license=(MIT)
depends=(python-coverage python-pytest-randomly python-dateutil)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('2ff3cd145c381ac87b1c35400475a8f019b15dc2267861aad0466f55b49e7813')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
