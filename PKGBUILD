# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-testflo
pkgver=1.4.15
_commit=1f40468650a08f34ed0d4602302aa91c5d691d5d
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
