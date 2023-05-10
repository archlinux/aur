# Contributor: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>
# Maintainer: Y Kirylau <actionless DOT loveless AT gmail MF com>

_pypiname=PyGObject-stubs
_pkgname=pygobject-stubs
pkgname="python-${_pkgname}"
pkgver=2.7.0
pkgrel=1
pkgdesc="PEP 561 Typing Stubs for PyGObject."
arch=('any')
url='https://github.com/pygobject/pygobject-stubs'
license=('LGPL')
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
)
source=("https://files.pythonhosted.org/packages/source/P/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
sha512sums=('70852239571513c69e2d4f54ae26d20005cc9eb047fb876a1e3b7be4b109b3b4a5633297e0a8a532fb15f11707f773fcab7fa656e6e3322b2f62a35c36995eef')

build() {
  cd ${_pypiname}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pypiname}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
