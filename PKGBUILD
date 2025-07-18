# Maintainer: Sergey Salnikov <salsergey at gmail dot com>
pkgname=gpxviewer-stable
pkgver=3.1.1
pkgrel=1
pkgdesc="Application for viewing and analyzing GPX and KML files"
arch=('any')
url="https://github.com/salsergey/gpxviewer"
license=('GPL-3.0')
groups=()
depends=('python-qcustomplot-pyqt6' 'python-lxml')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=(https://github.com/salsergey/gpxviewer/releases/download/${pkgver}/gpxviewer-${pkgver}.tar.xz)
sha256sums=('2e497aa6c23c86661245cd73959367b6a0cd7903fb4393e452197ebafe3dd0fd')

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
