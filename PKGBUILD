# Maintainer: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

_pkgname=cachelib
pkgbase="python-${_pkgname}"
pkgname=("python-${_pkgname}" "python2-${_pkgname}")
pkgver=0.1
pkgrel=1
arch=(any)
license=('BSD')
pkgdesc="Extract from werkzeug.cache."
url="https://github.com/pallets/cachelib"
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
conflicts=(${pkgname}-git)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('8ed41a14f3bc36393ecdce7dcc0023ce954900f4541463cf08b823b6c11a28532812c9873d32991f023986ed2ded39a560ee556447bc6d4c3e45c3d4d749c2b9')

prepare() {
  cp -a ${_pkgname}-${pkgver}{,-py2}
}

package_python-cachelib() {
  cd ${_pkgname}-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-cachelib() {
  cd ${_pkgname}-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
}
