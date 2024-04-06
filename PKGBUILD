# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-biscuits
pkgver=0.3.1
pkgrel=2
pkgdesc="Fast and tasty cookies handling"
url="https://github.com/pyrates/biscuits"
license=('MIT')
arch=('x86_64')
depends=('python')
makedepends=('cython' 'python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pyrates/biscuits/archive/$pkgver.tar.gz")
sha512sums=('d603ee536348686d958fde9de6c79f438f1ab753746518a05abc4b7ff5b236e6b744fad5a41d712c5c01867e63e63ce11da47394cdc4f9c2e89a04fa0fb4fb14')

build() {
  cd biscuits-$pkgver
  make compile
}

check() {
  cd biscuits-$pkgver
  PYTHONPATH="$PWD" pytest -v
}

package() {
  cd biscuits-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
