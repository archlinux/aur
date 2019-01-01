# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>

pkgname=python-ioflo
pkgver=1.7.5
pkgrel=1
pkgdesc='Flo based programming interface in python'
arch=('any')
url='https://ioflo.com'
license=('Apache')
depends=('python')
makedepends=('python-setuptools-git')
checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ioflo/ioflo/archive/v$pkgver.tar.gz")
sha512sums=('886767d72c4067727d47652fba157a76ecd8a6a5478a761feb3923992ffc585addfe892027ade104c5d44a56fd1645c0548ce3b554553f58e1104864c359470b')

build() {
  cd ioflo-$pkgver
  python setup.py build
}

check() {
  cd ioflo-$pkgver
  python setup.py pytest
}

package() {
  cd ioflo-$pkgver
  python setup.py install --root="$pkgdir" -O1
}
