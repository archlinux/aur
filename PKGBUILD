# Maintainer: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

_pkgname=dockerfile-parse
pkgbase="python-${_pkgname}"
pkgname=("python-${_pkgname}" "python2-${_pkgname}")
pkgver=0.0.15
pkgrel=1
arch=(any)
license=('BSD')
pkgdesc='Python library for parsing Dockerfile files.'
url='https://github.com/containerbuildsystem/dockerfile-parse'
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
source=("https://github.com/containerbuildsystem/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('2d9a8df5b498398f4a2330b88ed39488625c74ff22283ca5d97f68b4a3dfd36a01cc9b6acca34ad76a93b71677d72d30b246fd33ab43791795f3e661891ff176')

prepare() {
  cp -a ${_pkgname}-${pkgver}{,-py2}
}

package_python-dockerfile-parse() {
  depends=('python-six')
  cd ${_pkgname}-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-dockerfile-parse() {
  depends=('python2-six')
  cd ${_pkgname}-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
}
