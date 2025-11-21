# Maintainer: giver <giverc139@gmail.com>

_pyname=pyqodeng
pkgname=python-${_pyname}
pkgver=0.0.13
pkgrel=1
pkgdesc='PyQt/PySide Source Code Editor Widget'
url='https://github.com/angr/pyqodeng'
license=('MIT')
arch=('any')
depends=(
  'pyside6'
  'python'
  'python-pygments'
  'python-qtpy'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('1d74a848297a4efb06f66106efa183a4ab4d7ad6dd30506dfc02a5ffe7fc9c540729b57597ec991dc1758479c19757f5bd5293dea11ad4f6192a51e974adc6a2')
b2sums=('b8d746d82a8bbb66b39daa84aa8354ea33abe7e852e17b8c4fe28625b751d4092a766f2a8f30f07a97fc49fcfa5ca0c671862f9625b3167b4d1b62864d4a417f')

build() {
  cd ${_pyname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pyname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
