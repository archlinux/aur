# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgname=python-amqp
pkgver=5.0.8
pkgrel=1
pkgdesc="Low-level AMQP client for Python (fork of amqplib)"
arch=('any')
url="https://github.com/celery/py-amqp"
license=('LGPL')
depends=('python-vine')
checkdepends=('python-case' 'python-pytest-sugar')
source=("https://github.com/celery/py-amqp/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('e2769f215ac6c10bcbd86c52285aa7baff9d831878354eb0f4fc8bf5a42a3915edb71754f13cefb08b7cba1f68e101098b61fc85cc5d5492be964d5a4b35a0c3')

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
