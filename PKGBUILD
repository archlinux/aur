# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=sage-numerical-backends-gurobi
pkgver=9.0.0
pkgrel=1
pkgdesc="Gurobi mixed integer linear programming backend for SageMath"
arch=(x86_64)
url="https://github.com/mkoeppe/sage-numerical-backends-gurobi"
license=(GPL)
depends=(sagemath gurobi)
makedepends=(cython)
source=($pkgname-$pkgver.tar.gz::"https://github.com/mkoeppe/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('3affabdd8765bb123c9dd3585bfd94470d91391aaf361c054917746e45a2eca1')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
