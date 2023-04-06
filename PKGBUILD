# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-biscuits
pkgver=0.3.0
pkgrel=2
pkgdesc="Fast and tasty cookies handling"
url="https://github.com/pyrates/biscuits"
license=('MIT')
arch=('x86_64')
depends=('python')
makedepends=('cython' 'python-setuptools')
checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pyrates/biscuits/archive/$pkgver.tar.gz")
sha512sums=('75650cef8512301ffef29fd6b55f200a299812739038b43f470885e59a038ed66beeb851312f9e5a2b1a448d0bae15d68ead11bce0563632c559177b72688f95')

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
