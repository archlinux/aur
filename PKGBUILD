# Contributor: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>
# Maintainer: Y Kirylau <actionless DOT loveless AT gmail MF com>

_pypiname=PyGObject-stubs
_pkgname=pygobject-stubs
pkgname="python-${_pkgname}"
pkgver=2.10.0
pkgrel=2
pkgdesc="PEP 561 Typing Stubs for PyGObject."
arch=('any')
url='https://github.com/pygobject/pygobject-stubs'
license=('LGPL')
depends=(
	'python'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
	'python-setuptools'
)
source=("https://files.pythonhosted.org/packages/source/P/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
sha512sums=('11a0546a0b586178c428b995fdd41dd3292cf89bdc0f55091d379c05c2d46153e0d716d57c4749f9d535e9c7e37cd2a55082d22689093cd78d4e315128e9e2af')

build() {
  cd ${_pypiname}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pypiname}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
