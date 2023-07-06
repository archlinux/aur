# Contributor: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>
# Maintainer: Y Kirylau <actionless DOT loveless AT gmail MF com>

_pypiname=PyGObject-stubs
_pkgname=pygobject-stubs
pkgname="python-${_pkgname}"
pkgver=2.8.0
pkgrel=2
pkgdesc="PEP 561 Typing Stubs for PyGObject."
arch=('any')
url='https://github.com/pygobject/pygobject-stubs'
license=('LGPL')
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
	'python-setuptools'
)
source=("https://files.pythonhosted.org/packages/source/P/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
sha512sums=('a3a313173a051b24e2228de913706b514d3fee44504eca18b1bba67cda6ba811b03e5ab1fbd0dfeab5dc00e81873f026c3e3f7f143ee8dfaf4a5ab98db8de7aa')

build() {
  cd ${_pypiname}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pypiname}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
