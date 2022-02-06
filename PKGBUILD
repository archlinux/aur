# $Id: PKGBUILD 126373 2015-01-21 20:31:43Z arojas $
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=pari-jupyter
pkgver=1.4.1
pkgrel=1
pkgdesc='Jupyter kernel for PARI'
arch=(x86_64)
url='https://github.com/sagemath/pari-jupyter'
license=(GPL)
depends=(pari jupyter-notebook)
makedepends=(cython)
source=(https://pypi.io/packages/source/p/pari-jupyter/pari-jupyter-$pkgver.tar.gz)
sha256sums=('ed7af3d291c8b4906518c075bbdd60a2da6b22a32c82286985d9e132c6de78c6')

build() {
  cd $pkgname-$pkgver
  python setup.py build 
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  mv "$pkgdir"/{usr/,}etc
}
