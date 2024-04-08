# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgname=python-amqp
pkgver=5.2.0
pkgrel=2
pkgdesc="Low-level AMQP client for Python (fork of amqplib)"
arch=('any')
url="https://github.com/celery/py-amqp"
license=('BSD-3-Clause')
depends=('python-vine')
checkdepends=('python-case' 'python-pytest-sugar')
source=("https://github.com/celery/py-amqp/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('7d210c55c0873a5c346ce52d0e9ee258726fac1d359a98c7fe83a460712765979f1c62ab172a9447bbebb190f4b43f1a26ef9c074b61b348c85c4a29539f0873')

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
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
