# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-boltons
pkgver=23.1.1
_commit=9005642440e1479dd26c2c5d64c27f596445aaac
pkgrel=1
pkgdesc="Functionality that should be in the standard library. Like builtins, but Boltons."
url="https://github.com/mahmoud/boltons"
license=('BSD')
arch=('any')
depends=('python')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest')
source=("git+https://github.com/mahmoud/boltons.git#commit=$_commit")
sha512sums=('SKIP')

build() {
  cd boltons
  python setup.py build
}

check() {
  cd boltons
  pytest
}

package() {
  cd boltons
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
