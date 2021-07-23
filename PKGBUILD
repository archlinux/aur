# $Id: PKGBUILD 126373 2015-01-21 20:31:43Z arojas $
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=ore_algebra
pkgver=0.5
pkgrel=1
pkgdesc='An implementation of Ore algebras for Sage'
arch=(x86_64)
url='http://www.risc.jku.at/research/combinat/software/ore_algebra/'
license=(GPL)
depends=(sagemath)
makedepends=(cython python-pkgconfig)
source=(https://github.com/mkauers/ore_algebra/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('8a310f124866b718ef28e458750d13f6f1694a6ee0e13abf4db418a0528bef39')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --skip-build --optimize=1
}
