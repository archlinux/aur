pkgname=python-time-machine
_pkgname=${pkgname:7}
pkgver=2.9.0
pkgrel=1
pkgdesc="Travel through time in your tests."
arch=(any)
url="https://github.com/adamchainz/time-machine"
license=(MIT)
depends=(python-coverage python-pytest-randomly python-dateutil)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('60222d43f6e93a926adc36ed37a54bc8e4d0d8d1c4d449096afcfe85086129c2')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
