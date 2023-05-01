# Contributor: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>
# Maintainer: Y Kirylau <actionless DOT loveless AT gmail MF com>

_pypiname=PyGObject-stubs
_pkgname=pygobject-stubs
pkgname="python-${_pkgname}"
pkgver=2.6.0
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
sha512sums=('74ee37ceee0d7defc070022d65d0796f3101b69c025517e60c18fbd4cffee184089eaa7f3caff3e2c50ba612165814ffdabf06202ef87ed19ab7ed30dbbc1b65')

build() {
  cd ${_pypiname}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pypiname}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
