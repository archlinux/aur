# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgname=python-amqp
pkgver=2.6.0
pkgrel=1
pkgdesc="Low-level AMQP client for Python (fork of amqplib)"
arch=('any')
url="https://github.com/celery/py-amqp"
license=('LGPL')
depends=('python-vine')
checkdepends=('python-case' 'python-pytest-sugar')
source=("$pkgname-$pkgver.tar.gz::https://github.com/celery/py-amqp/archive/$pkgver.tar.gz")
sha512sums=('76a9efc4dac538a5ac808b15bd36453e3f4b20e9018266efacb3dbdc75e754462adae1267595149bf05a6ebf25a170ba703210ec263b283ba2eed16e836a26f8')

build() {
  cd py-amqp-$pkgver
  python setup.py build
}

check() {
  cd py-amqp-$pkgver
  pytest
}

package() {
  cd py-amqp-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
