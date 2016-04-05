# $Id: PKGBUILD 126373 2015-01-21 20:31:43Z arojas $
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=pari-jupyter
pkgver=1.1.0
pkgrel=1
pkgdesc="Jupyter kernel for PARI"
arch=(any)
url="http://www.sagemath.org"
license=(GPL)
depends=(pari-sage jupyter)
makedepends=(cython2)
source=(http://mirrors.mit.edu/sage/spkg/upstream/pari_jupyter/pari_jupyter-$pkgver.tar.gz)
md5sums=('80ec021034affd77cebba79eb4bc4f83')

build() {
  cd pari_jupyter-$pkgver
  python2 setup.py build 
}

package() {
  cd pari_jupyter-$pkgver
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
}
