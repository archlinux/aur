# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=sage-numerical-backends-gurobi
pkgver=9.3.1
pkgrel=1
pkgdesc='Gurobi mixed integer linear programming backend for SageMath'
arch=(x86_64)
url='https://github.com/mkoeppe/sage-numerical-backends-gurobi'
license=(GPL)
depends=(sagemath gurobi)
makedepends=(cython)
source=(https://github.com/mkoeppe/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('36648d1cecf080dc84b53aa67bee6d25f7507bec8561660cba08fe9b44d7ea65')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
