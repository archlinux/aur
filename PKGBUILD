# Maintainer: Ilya Elenskiy <elenskiy.ilya[@]gmail[.]com>
# Maintainer: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

_pypiname=Rx
_pkgname=rx
pkgbase="python-${_pkgname}"
pkgname=("python-${_pkgname}" "python2-${_pkgname}")
pkgname=python-rx
pkgver=1.6.1
pkgrel=2
pkgdesc="The Reactive Extensions for Python (RxPY)"
arch=('any')
url='http://reactivex.io'
license=('apache')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/R/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
sha512sums=('8602b5175c058e855ac4b67d8feed435f93632da2f4033fe0db54fcbb012a702786b29f97fe3fd641f054c3a61478dccac21c614b5708f7bfb0b986c9951e6a9')

prepare() {
  cp -a ${_pypiname}-${pkgver}{,-py2}
}

package_python-rx() {
  cd ${_pypiname}-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-rx() {
  cd ${_pypiname}-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
}

