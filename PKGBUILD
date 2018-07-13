# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

_name=flake8-bugbear
pkgname=python-flake8-bugbear
pkgver=18.2.0
pkgrel=1
pkgdesc='Plugin for Flake8 finding likely bugs and design problems in your program'
arch=('any')
url=https://github.com/PyCQA/flake8-bugbear
license=('MIT')
depends=('flake8' 'python-attrs')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('b4aec1a0361a8360328fe824deb74dd006f85fafcf36c113d0b19d4da5cd3a5cbd0eeab95167ef116fbe4d1920337cd6584e4d1fefad00748d409b67b8b4733e')

build() {
  cd $_name-$pkgver
  python setup.py build
}

check() {
  cd $_name-$pkgver
  python -m tests.test_bugbear
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
