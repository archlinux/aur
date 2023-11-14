# Maintainer: Sergey Salnikov <salsergey at gmail dot com>
pkgname=gpxviewer-stable
pkgver=2.4.1
pkgrel=1
pkgdesc="Application for viewing and analyzing GPX and KML files"
arch=('any')
url="https://github.com/salsergey/gpxviewer"
license=('GPL3')
groups=()
depends=('python-qcustomplot-pyqt5' 'python-lxml')
makedepends=('python-setuptools')
source=("https://github.com/salsergey/gpxviewer/releases/download/2.4.1/gpxviewer-${pkgver}.tar.xz")
sha256sums=('ddbfaf8398c2d9bde5dfc004da5e613e3f11a4ee7fff59b3987cd069a2a75dae')

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
