# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=guidata
pkgname=python-$_name
pkgver=3.0.5
_pkgver=v$pkgver
pkgrel=1
pkgdesc="Python library generating graphical user interfaces for easy dataset editing and display"
arch=('any')
url='https://github.com/PierreRaybaut/guidata'
license=('custom:BSD-3-clause')
depends=(python-qtpy python-pyqt5-datavisualization python-pyqt5-webengine python-h5py python-pandas python-matplotlib python-beautifulsoup4 python-sphinx)
makedepends=(python-build python-installer python-wheel)
optdepends=('spyder: GUI-based test launcher, dict/array editor')
source=("$_name-$pkgver.tar.gz::https://github.com/Codra-Ingenierie-Informatique/$_name/archive/refs/tags/$_pkgver.tar.gz")
sha256sums=('60cd90ba0a3448d915a5d55079edebe67949d350c237ad5f42c454b31b46bf3c')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
