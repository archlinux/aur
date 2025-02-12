# $Id: PKGBUILD 126373 2015-01-21 20:31:43Z arojas $
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=pari-jupyter
pkgver=1.4.3
pkgrel=1
pkgdesc='Jupyter kernel for PARI'
arch=(x86_64)
url='https://github.com/sagemath/pari-jupyter'
license=(GPL)
depends=(pari jupyter-notebook)
makedepends=(cython)
source=(https://pypi.io/packages/source/p/pari-jupyter/pari-jupyter-$pkgver.tar.gz)
sha256sums=('7cd9291d05b92b8303c6ae8cf25622e5ecbab1ac2bcf13911f900ea987471b9d')

build() {
  cd $pkgname-$pkgver
  python setup.py build 
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  mv "$pkgdir"/{usr/,}etc
}
