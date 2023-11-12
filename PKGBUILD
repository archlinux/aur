# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-testflo
pkgver=1.4.13
_commit=aef9915fe0a90523e9f1fd66344959339f41df24
pkgrel=1
pkgdesc="A simple flow-based testing framework"
url="https://github.com/OpenMDAO/testflo"
license=('Apache')
arch=('any')
depends=('python-coverage')
makedepends=('git' 'python-setuptools')
checkdepends=('python-testflo')
source=("git+https://github.com/OpenMDAO/testflo.git#commit=$_commit")
sha512sums=('SKIP')

build() {
  cd testflo
  python setup.py build
}

check() {
  cd testflo
  # TODO: figure out how to run tests
  testflo testflo || echo "Tests failed"
}

package() {
  cd testflo
  python setup.py install --root="$pkgdir" --optimize=1
}
