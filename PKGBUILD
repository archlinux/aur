# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=sage-numerical-backends-coin
pkgver=9.0b12
pkgrel=1
pkgdesc="COIN-OR mixed integer linear programming backend for SageMath"
arch=(x86_64)
url="https://github.com/mkoeppe/sage-numerical-backends-coin"
license=(GPL)
depends=(sagemath coin-or-cbc)
makedepends=(cython python-pkgconfig)
source=($pkgname-$pkgver.tar.gz::"https://github.com/mkoeppe/sage-numerical-backends-coin/archive/v$pkgver.tar.gz")
sha256sums=('4bd6cec9a2e78e47741a73fde0d064a2aaebd1e2d9f44ccca70e436f2094f272')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
