# Contributor: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>
# Maintainer: Y Kirylau <actionless DOT loveless AT gmail MF com>

_pkgname=pygobject-stubs
pkgname="python-${_pkgname}"
pkgver=2.15.0
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
sha512sums=('9e06fff109ef46d0dc70af7923d092549dd03e3c70e262b1dede6c121fdab17cc515be80b3d2ad21c2e7032b7e79eb5eecf87ebe9d55ce8b1e15be33d04a7c1f')

build() {
  cd ${_pkgname}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pkgname}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
