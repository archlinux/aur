# Maintainer: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

_pypiname=PyGObject-stubs
_pkgname=pygobject-stubs
pkgbase="python-${_pkgname}"
pkgname=("python-${_pkgname}" "python2-${_pkgname}")
pkgver=1.0.0
pkgrel=1
pkgdesc="PEP 561 Typing Stubs for PyGObject."
arch=('any')
url='https://github.com/pygobject/pygobject-stubs'
license=('LGPL')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/P/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
sha512sums=('a4766a54caa06c21ee176ab4d3d174f8fa70f0ee1fb300ebde4746377a40dd91d54e027ef9aa60dc9346b26966f85fc2a98bda9fd25aa17174000de262126713')

prepare() {
  cp -a ${_pypiname}-${pkgver}{,-py2}
}

package_python-pygobject-stubs() {
  cd ${_pypiname}-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-pygobject-stubs() {
  cd ${_pypiname}-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
}
