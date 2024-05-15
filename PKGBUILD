# Contributor: David Runge <dvzrv@archlinux.org>
pkgname=python2-pytest-rerunfailures
pkgver=6.0
pkgrel=1
pkgdesc='A plugin for py.test that re-runs failed tests to eliminate intermittent failures'
arch=('any')
url='https://github.com/pytest-dev/pytest-rerunfailures/'
license=('MPL2')
depends=('python2-pytest')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest' 'python2-mock')
source=("https://files.pythonhosted.org/packages/source/p/pytest-rerunfailures/pytest-rerunfailures-${pkgver}.tar.gz")
sha512sums=('654a6afea01e5d7e0f516a6427eee5bd2947757a0c05ee177521f607d8cc7e472e614267e414ce014528c4bd5de99a4bfaf5381d6c5dbf5abd9e7170a4c3fbc8')

build() {
  cd "pytest-rerunfailures-${pkgver}"
  python2 setup.py build
}

check() {
  cd "pytest-rerunfailures-${pkgver}"
  py.test2 test_pytest_rerunfailures.py
}

package() {
  cd "pytest-rerunfailures-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -t "${pkgdir}/usr/share/doc/${pkgname}" -vDm 644 {CHANGES.rst,README.rst}
}
