# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-testscenarios
pkgver=0.5.0
pkgrel=11
pkgdesc="Testscenarios, a pyunit extension for dependency injection"
arch=('any')
license=('Apache')
url="https://launchpad.net/testscenarios"
depends=('python38-testtools')
makedepends=('python38-setuptools' 'python38-pbr')
source=("https://pypi.python.org/packages/source/t/testscenarios/testscenarios-$pkgver.tar.gz")
sha512sums=('f08b868babf504482369c5cb945d3e95bca1cc00f92d5013f6898c488051be0c26dc49aaabcef362aea45450a8d041d9826fb6b5c848beec013fb102d6935521')

build() {
  cd testscenarios-$pkgver
  python3.8 setup.py build
}

check() {
  cd testscenarios-$pkgver
  python3.8 -m testtools.run testscenarios.test_suite
}

package() {
  cd testscenarios-$pkgver
  python3.8 setup.py install --root="${pkgdir}" --optimize=1
}
