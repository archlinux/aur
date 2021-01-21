# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgname=python-amqp
pkgver=5.0.3
pkgrel=1
pkgdesc="Low-level AMQP client for Python (fork of amqplib)"
arch=('any')
url="https://github.com/celery/py-amqp"
license=('LGPL')
depends=('python-vine')
checkdepends=('python-case' 'python-pytest-sugar')
source=("https://github.com/celery/py-amqp/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('ae36383bbc01a9ac7d1024182c9da25faf0ac2ca361d57d9058f6cb0df399dc363c981cf3680f7c19cc11aa522295051ae5614122fe994621349cf389adfc3bf')

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
