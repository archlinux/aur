# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=sardana
pkgname=python-$_name
pkgver=3.3.8
pkgrel=1
pkgdesc="Instrument control and data acquisition system"
arch=('any')
url='http://www.sardana-controls.org/'
license=('LGPL')
depends=(
  python-taurus itango python-lxml python-click python-pyqtgraph
  python-numpy python-h5py python-mock libibus python-pytest spyder
  python-scipy libblockdev python-pyqt5-datavisualization
)
optdepends=(gedit gst-editing-services gom libgexiv2)
makedepends=(python-setuptools)
source=("$_name-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('91f305eb2eb4952e42cfda3529bcfc18768b5c8f75f41ccbcfc35642f57983a3')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
