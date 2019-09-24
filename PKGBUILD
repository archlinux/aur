# Maintainer:

pkgname=python2-dominate
pkgver=2.4.0
pkgrel=1
pkgdesc="Python library for creating and manipulating HTML documents"
arch=('any')
url="https://github.com/Knio/dominate"
license=('LGPL3')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Knio/dominate/archive/$pkgver.tar.gz")
sha512sums=('93b721762175f14339d5b027af59d8475485b2674c019990bdc0989067448f4b74350d16b19c396ee2e514822930e821675f8bbab96e03be3e5899dd95a86ee4')

build() {
  cd dominate-$pkgver
  python2 setup.py build
}

check() {
  cd dominate-$pkgver
  python2 setup.py pytest
}

package() {
  cd dominate-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}
