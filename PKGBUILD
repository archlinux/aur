# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>

pkgname=python-ioflo
pkgver=1.7.4
pkgrel=2
pkgdesc='Flo based programming interface in python'
arch=('any')
url='http://ioflo.com'
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ioflo/ioflo/archive/v$pkgver.tar.gz")
sha512sums=('415b43b66c1be479e8ba4fc993f180418f95f1ae0d16ff8c496476da7a04f6caa0f918a064c60034cd926f4f49c1112946b911b57339a76ee5b0d2564ade224f')

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
