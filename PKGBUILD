# Maintainer: Daniel M. Capella <polycitizen@archlinux.info>

_pkgname=flake8-bugbear
pkgname=python-flake8-bugbear
pkgver=17.12.0
pkgrel=1
pkgdesc='A plugin for Flake8 finding likely bugs and design problems in your program'
arch=('any')
url=https://github.com/PyCQA/flake8-bugbear
license=('MIT')
depends=('flake8' 'python-attrs')
makedepends=('python-setuptools')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('13e3b2191f31cf02d270e598bc7ebcc1379b0a5f7271fbd0d32d3c026407fced88eadbe936edb32cdfd7139715a5f041387e0e20f840cce1f7712e29d4150832')

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
