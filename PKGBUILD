# Maintainer: Sergey Salnikov <salsergey at gmail dot com>
pkgname=gpxviewer-stable
pkgver=3.0
pkgrel=1
pkgdesc="Application for viewing and analyzing GPX and KML files"
arch=('any')
url="https://github.com/salsergey/gpxviewer"
license=('GPL-3.0')
groups=()
depends=('python-qcustomplot-pyqt6' 'python-lxml')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=(https://github.com/salsergey/gpxviewer/releases/download/${pkgver}/gpxviewer-${pkgver}.tar.xz)
sha256sums=('1108e03deb7127d3c7529366bee3569fe22fcfb5d00dcdb130a825e62e520f8f')

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
