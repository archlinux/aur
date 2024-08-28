# Maintainer: Sergey Salnikov <salsergey at gmail dot com>
pkgname=gpxviewer-stable
pkgver=3.1
pkgrel=1
pkgdesc="Application for viewing and analyzing GPX and KML files"
arch=('any')
url="https://github.com/salsergey/gpxviewer"
license=('GPL-3.0')
groups=()
depends=('python-qcustomplot-pyqt6' 'python-lxml')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=(https://github.com/salsergey/gpxviewer/releases/download/${pkgver}/gpxviewer-${pkgver}.tar.xz)
sha256sums=('d78e81cff92f8f9622994776f05c6ed07f18d44a707411c8ada3b2d30a72c5b1')

build() {
  echo "Building gpxviewer ..."
  cd "${srcdir}/gpxviewer-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  echo "Installing gpxviewer ..."
  cd "${srcdir}/gpxviewer-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
