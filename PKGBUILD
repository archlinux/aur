# Maintainer: Sergey Salnikov <salsergey at gmail dot com>
pkgname=gpxviewer-stable
pkgver=2.4
pkgrel=1
pkgdesc="GPX Viewer"
arch=('any')
url="https://osdn.net/projects/gpxviewer"
license=('GPL3')
groups=()
depends=('python-qcustomplot-pyqt5' 'python-lxml')
makedepends=('python-setuptools')
source=("https://osdn.net/dl/gpxviewer/gpxviewer-${pkgver}.tar.xz")
sha256sums=('4e41bcea804171e4cdf9badd1534efa34765ffee8b01689e38e04ed329bdc3d4')

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
