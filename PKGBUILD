# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

_pkgname=flake8-bugbear
pkgname=python-flake8-bugbear
pkgver=18.2.0
pkgrel=1
pkgdesc='A plugin for Flake8 finding likely bugs and design problems in your program'
arch=('any')
url=https://github.com/PyCQA/flake8-bugbear
license=('MIT')
depends=('flake8' 'python-attrs')
makedepends=('python-setuptools')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('b46594a325066f1a2694babf01cfc87e73a392e9bb821d4b5d568ec4f96c04b564bdebf6e3fe2c57a6e788a179988e5ee76c9990dcdf34211e5d987af13f7f7b')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

check() {
  cd $_pkgname-$pkgver
  python -m tests.test_bugbear
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
