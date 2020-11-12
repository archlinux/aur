# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Anatol Pomozov
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-daemon
pkgver=2.2.4
pkgrel=5
pkgdesc='Library to implement a well-behaved Unix daemon process'
arch=('any')
url='https://pypi.python.org/pypi/python-daemon'
license=('Apache')
depends=('python' 'python-lockfile' 'python-docutils')
makedepends=('python-setuptools' 'python-docutils' 'python-lockfile')
checkdepends=('python-mock' 'python-testscenarios')
source=(https://files.pythonhosted.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('57c84f50a04d7825515e4dbf3a31c70cc44414394a71608dee6cfde469e81766')

build() {
  cd "${srcdir}"/python-daemon-$pkgver
  python setup.py build
}

check() {
  cd python-daemon-$pkgver
  python setup.py test
}

package_python-daemon() {
  cd "${srcdir}"/python-daemon-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.ASF-2 "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.ASF-2
  install -Dm644 LICENSE.GPL-3 "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.GPL-3
}
