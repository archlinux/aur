# Contributor: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>
# Maintainer: Y Kirylau <actionless DOT loveless AT gmail MF com>

_pkgname=pygobject-stubs
pkgname="python-${_pkgname}"
pkgver=2.13.0
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
sha512sums=('b669c63f4c1eeb10aa110009f714ae36f579eeb01e80f6df4518c5f105493397cd8e9764c5e11301d457e127df120a1a2c135a16c8add1fb2f4a5ce47efe7234')

build() {
  cd ${_pkgname}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pkgname}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
