# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgname=python-amqp
pkgver=2.6.1
pkgrel=1
pkgdesc="Low-level AMQP client for Python (fork of amqplib)"
arch=('any')
url="https://github.com/celery/py-amqp"
license=('LGPL')
depends=('python-vine')
checkdepends=('python-case' 'python-pytest-sugar')
source=("https://github.com/celery/py-amqp/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('47e2d848df8023e31969fef54456eced1c63db49d7570264c6fdb969399d7a97998e948cf65995f8216cbf9932795573c13b6b08bcbcd5d9865155caaeee7aeb')

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
