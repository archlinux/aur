# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgname=python-amqp
pkgver=2.5.2
pkgrel=3
pkgdesc="Low-level AMQP client for Python (fork of amqplib)"
arch=('any')
url="https://github.com/celery/py-amqp"
license=('LGPL')
depends=('python-vine')
checkdepends=('python-case' 'python-pytest-sugar')
source=("$pkgname-$pkgver.tar.gz::https://github.com/celery/py-amqp/archive/$pkgver.tar.gz")
sha512sums=('dfdc337552a0db86a717b1b2a1139eefb4c63c8204ead5e103edd32ffdcdbdfbb4f936acf02eb1cc1d7ff53cbfaa244e795772908e3845e6a2349e4888cc94dd')

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
