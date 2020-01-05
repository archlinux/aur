# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=sage-numerical-backends-gurobi
pkgver=9.0b12
pkgrel=1
pkgdesc="Gurobi mixed integer linear programming backend for SageMath"
arch=(x86_64)
url="https://github.com/mkoeppe/sage-numerical-backends-gurobi"
license=(GPL)
depends=(sagemath gurobi)
makedepends=(cython)
source=($pkgname-$pkgver.tar.gz::"https://github.com/mkoeppe/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('2c1ca86a9460b605d6228dc68c753b102f39225bb096959ad0edbf01ef372d1f')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
