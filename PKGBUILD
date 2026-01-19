# Maintainer: Sergey Salnikov <salsergey at gmail dot com>
pkgname=gpxviewer-stable
pkgver=3.1.2
pkgrel=1
pkgdesc="Application for viewing and analyzing GPX and KML files"
arch=('any')
url="https://github.com/salsergey/gpxviewer"
license=('GPL-3.0-or-later')
groups=()
depends=('python-qcustomplot-pyqt6' 'python-lxml')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=(https://github.com/salsergey/gpxviewer/releases/download/${pkgver}/gpxviewer-${pkgver}.tar.xz)
sha256sums=('bdefbe850d742d154bcf3d0273007bfbd1c3f65dc1611d71607510f361ac4dc3')

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
