# Maintainer: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

_pypiname=PyGObject-stubs
_pkgname=pygobject-stubs
pkgbase="python-${_pkgname}"
pkgname=("python-${_pkgname}" "python2-${_pkgname}")
pkgver=0.0.2
pkgrel=1
pkgdesc="PEP 561 Typing Stubs for PyGObject."
arch=('any')
url='https://github.com/pygobject/pygobject-stubs'
license=('LGPL')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/P/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
sha512sums=('c2b8eb76b8654794a07234cb1fd4116be30d02f6b8ffe329d1ba96a55059a8936860fdf3b1ac268d30f9ca63d14f99797427e3a597fa00d8b0530cbd61a626b5')

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
