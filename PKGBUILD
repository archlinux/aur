# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-biscuits
pkgver=0.2.1
pkgrel=5
pkgdesc="Fast and tasty cookies handling"
url="https://github.com/pyrates/biscuits"
license=('MIT')
arch=('x86_64')
depends=('python')
makedepends=('cython' 'python-setuptools')
checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pyrates/biscuits/archive/$pkgver.tar.gz")
sha512sums=('ccb8f00460f1d73eb28c44ab1a179d98109dc0427196cddcc86f97a4224e5f2230a33caaabcb10ae621f049e7097b2cd03b1cecc8a140b49ee0d68d1384895af')

build() {
  cd biscuits-$pkgver
  make compile
}

check() {
  cd biscuits-$pkgver
  python setup.py pytest
}

package() {
  cd biscuits-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
