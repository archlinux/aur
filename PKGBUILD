# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-pyepsg
pkgver=0.4.0
pkgrel=2
pkgdesc='A simple interface to https://epsg.io/'
url='https://pyepsg.readthedocs.io/'
arch=('any')
license=('LGPL3')

depends=('python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')

_pypi=pyepsg
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  '2d08fad1e7a8b47a90a4e43da485ba95705923425aefc4e2a3efa540dbd470d7'
)

build() {
  cd "$_pypi-$pkgver"
  python -m build --no-isolation --wheel
}

package() {
  cd "$_pypi-$pkgver"
  python -m installer --destdir="$pkgdir" "dist/$_pypi-$pkgver-"*.whl
}
