# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=sardana
pkgname=python-$_name
pkgver=3.4.2
pkgrel=1
pkgdesc="Instrument control and data acquisition system"
arch=('any')
url="https://gitlab.com/sardana-org/${_name}"
license=('LGPL')
depends=(
  python-taurus itango python-lxml python-click python-pyqtgraph
  python-numpy python-h5py python-mock libibus python-pytest spyder
  python-scipy libblockdev python-pyqt5-datavisualization
  python-jsonpointer gobject-introspection-runtime
)
optdepends=(gedit gst-editing-services gom libgexiv2)
makedepends=(python-setuptools)
source=("$_name-$pkgver.tar.gz::https://gitlab.com/sardana-org/${_name}/-/archive/${pkgver}/${_name}-${pkgver}.tar.gz")
sha256sums=('fd5ef987f106529a1c510091d4f2d0ac149dd51a14657bd258392bcbc2e6278b')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
