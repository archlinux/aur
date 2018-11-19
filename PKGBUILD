# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>

_pkgname=pytest-csv
pkgbase="python-${_pkgname}"
pkgname=("python-${_pkgname}" "python2-${_pkgname}")
pkgver=2.0.1
pkgrel=1
arch=(x86_64)
license=('GPL')
pkgdesc="CSV output for pytest."
url="https://github.com/nicoulaj/pytest-csv"
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('5209dec4ab71fdd94ab99eb27ae53698')
sha256sums=('fdc8c669ef8b6225e93836b03d9955c28f4b401da323073f446500847adc31b0')
sha512sums=('33ef73e685af34373876516c64afe533008cc7497f63d8a6a4db82081d3fba2831ab84ea38614660d39091ecfa17c99c10e17bcff56dd92a3cb1161d722f5bbd')

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
