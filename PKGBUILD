# Contributor: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>
# Maintainer: Y Kirylau <actionless DOT loveless AT gmail MF com>

_pkgname=pygobject-stubs
pkgname="python-${_pkgname}"
pkgver=2.14.0
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
sha512sums=('fdc24d72f6562b636e41960b98796f4cbb149a5a88f0e01caef7070e46000c13918220e6275873c4911c2b2828651992086f65b443a7817aafbcea84edd6166d')

build() {
  cd ${_pkgname}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pkgname}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
