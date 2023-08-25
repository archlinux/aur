# Maintainer: Sergey Salnikov <salsergey at gmail dot com>
pkgname=gpxviewer-stable
pkgver=2.4.1
pkgrel=1
pkgdesc="Application for viewing and analyzing GPX and KML files"
arch=('any')
url="https://osdn.net/projects/gpxviewer"
license=('GPL3')
groups=()
depends=('python-qcustomplot-pyqt5' 'python-lxml')
makedepends=('python-setuptools')
source=("https://osdn.net/dl/gpxviewer/gpxviewer-${pkgver}.tar.xz")
sha256sums=('170401f6c6aaba9d571cc684c2927910d782d3a8b995df5db5f9518f3a0e612f')

build() {
  echo "Building gpxviewer ..."
  cd "${srcdir}/gpxviewer-${pkgver}"
  python3 setup.py build
}

package() {
  echo "Installing gpxviewer ..."
  cd "${srcdir}/gpxviewer-${pkgver}"
  python3 setup.py install --skip-build -O1 --prefix /usr --root "${pkgdir}"
}
