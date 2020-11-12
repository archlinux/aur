# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>

pkgname=python-pytddmon
pkgver=1.0.8
_commit=4b2875cfda88050537af58a4103ea8809c27ee1c
pkgrel=7
pkgdesc='Continuous unit testing in Python'
arch=('any')
url='https://pytddmon.org'
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("$pkgname-$_commit.tar.gz::https://github.com/objarni/pytddmon/archive/$_commit.tar.gz")
sha512sums=('5b71938b0f80995a8e9c9590697e1ccc53f30339d0dc63a31aa37957d8f354913e84444eecaebd6a8e631af645baefbdbed09aaa65f53d7e0d49c90fbc2c7a46')

build() {
  cd pytddmon-$_commit
  python setup.py build
}

check() {
  cd pytddmon-$_commit
  python setup.py nosetests
}

package() {
  cd pytddmon-$_commit
  python setup.py install --root="$pkgdir" -O1
}
