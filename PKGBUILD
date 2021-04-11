# Maintainer: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

_pkgname=dockerfile-parse
pkgbase="python-${_pkgname}"
pkgname=("python-${_pkgname}" "python2-${_pkgname}")
pkgver=1.1.0
pkgrel=1
arch=(any)
license=('BSD')
pkgdesc='Python library for parsing Dockerfile files.'
url='https://github.com/containerbuildsystem/dockerfile-parse'
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
source=("https://github.com/containerbuildsystem/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('b8236bf983373542072e0cf72e75fc3eb796671687ccdceebde626c25187577dd2c0066d0791dddcc8e65134d061926280b7896af0f7fd09b48fd1a209df0560')

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
