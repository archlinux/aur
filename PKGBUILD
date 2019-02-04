# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgbase=python-amqp
pkgname=('python-amqp' 'python2-amqp')
pkgver=2.4.1
pkgrel=1
pkgdesc="Low-level AMQP client for Python (fork of amqplib)"
arch=('any')
url="https://github.com/celery/py-amqp"
license=('LGPL')
makedepends=('python-vine' 'python2-vine')
checkdepends=('python-case' 'python2-case' 'python-pytest-sugar' 'python2-pytest-sugar')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/celery/py-amqp/archive/v$pkgver.tar.gz")
sha512sums=('4c634aa8614fbc1d3cd01786144c0ce8773ab9b2ff6bb6bcf1bc1f7c8f05a5208b9fda3a18f182bad3bd8c8a84fa5640cbd322204e0fab8d389f5b5b872dfe5f')

build() {
  cd py-amqp-$pkgver
  python setup.py build
  python2 setup.py build
}

check() {
  cd py-amqp-$pkgver
  pytest
  pytest2
}

package_python-amqp() {
  depends=('python-vine')

  cd py-amqp-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-amqp() {
  depends=('python2-vine')

  cd py-amqp-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
