# Contributor: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>
# Maintainer: Y Kirylau <actionless DOT loveless AT gmail MF com>

_pkgname=pygobject-stubs
pkgname="python-${_pkgname}"
pkgver=2.12.0
pkgrel=1
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
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('4751c2f2d2841b0c04021cf48e3a685e83f54d616ce00f2c0e940bbc221a62df429240b4395149043bdc14e9a06c6866f6d9d54d4bd08b047b28d7093bcef2a0')

build() {
  cd ${_pkgname}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pkgname}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
