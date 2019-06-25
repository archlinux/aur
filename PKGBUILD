# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>

_pkgname=pytest-csv
pkgbase="python-${_pkgname}"
pkgname=("python-${_pkgname}" "python2-${_pkgname}")
pkgver=2.0.2
pkgrel=1
arch=(x86_64)
license=('GPL')
pkgdesc="CSV output for pytest."
url="https://github.com/nicoulaj/pytest-csv"
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('5157c7a6b7cb22ff781002f0e1065222fbd4345d3f6fe24abea5059059d3559e3488e023047538d4cc49dbe3a7bf2f2fc543d4626e927bbcb35d841dac04abbe')

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
