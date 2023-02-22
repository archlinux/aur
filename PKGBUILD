# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=guidata
pkgname=python-$_name
pkgver=2.3.1
pkgrel=1
pkgdesc="Python library generating graphical user interfaces for easy dataset editing and display"
arch=('any')
url='https://github.com/PierreRaybaut/guidata'
license=('custom:CeCILL')
depends=(python-qtpy python-pyqt5-datavisualization python-pyqt5-webengine python-h5py python-pandas python-matplotlib python-beautifulsoup4 python-sphinx)
makedepends=(python-setuptools)
optdepends=('spyder: GUI-based test launcher, dict/array editor')
source=("$_name-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9d8104826ca76c8bed79ab8f680cc6a40e74547ce3fb3d04ca6cb57ddeac1819')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 Licence_CeCILL_V2-en.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
