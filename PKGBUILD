# Contributor: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>
# Maintainer: Y Kirylau <actionless DOT loveless AT gmail MF com>

_pypiname=PyGObject-stubs
_pkgname=pygobject-stubs
pkgname="python-${_pkgname}"
pkgver=2.2.0
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
sha512sums=('91f500a960941f8965d7719d6e1af86f91c311305f4f51476fe35a4f3e3fb381d028bfa1d10596d440206861084460dc92d31b047564ad1c9db23d8bbca1db4b')

build() {
  cd ${_pypiname}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pypiname}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
