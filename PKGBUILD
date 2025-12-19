# Contributor: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>
# Maintainer: Y Kirylau <actionless DOT loveless AT gmail MF com>

_pkgname=pygobject-stubs
pkgname="python-${_pkgname}"
pkgver=2.16.0
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
sha512sums=('476ddc623da19bf7ec917e2339ff10d26d5e7e49faae4cb70545c7383c24b34e9e44e4112719fec695b14dfc98baacdc6b891287c8fbb6bf4c325e1ea754379c')

build() {
  cd ${_pkgname}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pkgname}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
