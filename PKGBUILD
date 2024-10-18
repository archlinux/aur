# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=ore_algebra
pkgver=0.5
pkgrel=1
pkgdesc='An implementation of Ore algebras for Sage'
arch=(x86_64)
url='http://www.risc.jku.at/research/combinat/software/ore_algebra/'
license=(GPL-2.0-only)
depends=(sagemath)
makedepends=(cython
             git
             python-build
             python-installer
             python-pkgconfig
             python-setuptools
             python-wheel)
source=(git+https://github.com/mkauers/ore_algebra#tag=$pkgver)
sha256sums=('880ee5826144e3d37042e053d6d094c2e7219adb0623060a98eb3859336fbf00')

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
