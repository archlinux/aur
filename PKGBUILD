# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>

_pkgname=pytest-csv
pkgbase="python-${_pkgname}"
pkgname=("python-${_pkgname}" "python2-${_pkgname}")
pkgver=1.1.2
pkgrel=1
arch=(x86_64)
license=('GPL')
pkgdesc="CSV output for pytest."
url="https://github.com/nicoulaj/pytest-csv"
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('bcf198528b69aec751c2b500a8994008')
sha256sums=('96cc7cef5b978a13811413fee3f002005dcc4a5aee10481f94bdaafc5a297b24')
sha512sums=('e280f99286f14f78c1820de334e7027dbb25fbba6c14e8a84e3c2dd61339cdd7d630ebbbebbae6f17e49fbeecc11e6098c29653a69247caa446547e0655c4541')

prepare() {
  cp -a ${_pkgname}-${pkgver}{,-py2}
}

package_python-pytest-csv() {
  cd ${_pkgname}-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-pytest-csv() {
  cd ${_pkgname}-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
}
