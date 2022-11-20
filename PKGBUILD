# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-unittest-mixins
pkgver=1.6
pkgrel=8
pkgdesc='Helpful mixins for unittest classes'
arch=('any')
license=('Apache')
url='https://github.com/nedbat/unittest-mixins'
depends=('python38-six')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nedbat/unittest-mixins/archive/v$pkgver.tar.gz")
sha512sums=('0d4a0bbf80264f34a03aebbb2668733cd3753f99b24b006ea6704a2b97df9fb51755e8c4efd0094219e65d25756ea31ff27d3892b32ab6829050236a6bcbc986')

build() {
  cd "$srcdir"/unittest-mixins-$pkgver
  python3.8 setup.py build
}

check() {
  cd "$srcdir"/unittest-mixins-$pkgver
  python3.8 setup.py pytest
}

package() {
  cd unittest-mixins-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
