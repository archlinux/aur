# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgname=python-amqp
pkgver=5.0.2
pkgrel=3
pkgdesc="Low-level AMQP client for Python (fork of amqplib)"
arch=('any')
url="https://github.com/celery/py-amqp"
license=('LGPL')
depends=('python-vine')
checkdepends=('python-case' 'python-pytest-sugar')
source=("https://github.com/celery/py-amqp/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('0297e73abcd496cadcdf65b2da52e76792b4c0d36fe9d59f8c8cf3ed17e2370c6fbbce486a0a33296bf865e2c22b621bc708864a91b06a3e68460e96d724ce18')

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
