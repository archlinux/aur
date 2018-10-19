# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-biscuits
pkgver=0.1.1
pkgrel=1
pkgdesc="Fast and tasty cookies handling"
url="https://github.com/pyrates/biscuits"
license=('MIT')
arch=('x86_64')
depends=('python')
makedepends=('cython' 'python-setuptools')
checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pyrates/biscuits/archive/$pkgver.tar.gz")
sha512sums=('b3370181fc6675913cb677ac5f9a6a8a97ecba7c99ba1c3180414192da9393142f3315d6680cb40da7a49c6aa2f3de6fba46db6a62ce6c42a6953cf52d5bf269')

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
