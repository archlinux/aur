# $Id: PKGBUILD 126373 2015-01-21 20:31:43Z arojas $
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=jupyter-gap
pkgver=0.6
pkgrel=1
pkgdesc="Jupyter kernel for GAP"
arch=(any)
url="https://github.com/gap-packages/jupyter-gap"
license=(GPL)
depends=(gap jupyter)
source=($pkgname-$pkgver::"https://github.com/gap-packages/jupyter-gap/archive/v$pkgver.tar.gz")
md5sums=('aee20c4c9d369f2a1b2479cc77d60cc3')

build() {
  cd $pkgname-$pkgver
  python setup.py build 
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
