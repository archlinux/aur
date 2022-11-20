# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-process-tests
pkgver=2.1.2
pkgrel=5
pkgdesc="Tools for testing processes"
arch=('any')
url="https://pypi.python.org/pypi/process-tests"
license=('BSD')
depends=('python38')
makedepends=('python38-setuptools')
source=("https://pypi.io/packages/source/p/process-tests/process-tests-$pkgver.tar.gz")
sha512sums=('56a76d8467312de34413994e663eb63378ff179720b883037735eae9d8f23a5cc0ea32d4a9a2f9041af417b5ada07b7948fd481e3d5b2cb43db3c19183f6b263')

build() {
  cd "$srcdir"/process-tests-$pkgver
  python3.8 setup.py build
}

# "project skel" sets up pytest but there are zero tests to run
# (and pytest therefore exits 5)

package_python38-process-tests() {
  cd process-tests-$pkgver
  python3.8 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
