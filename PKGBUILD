# $Id: PKGBUILD 126373 2015-01-21 20:31:43Z arojas $
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=pari-jupyter
pkgver=1.2.2
pkgrel=1
pkgdesc="Jupyter kernel for PARI"
arch=(any)
url="https://github.com/jdemeyer/pari_jupyter"
license=(GPL)
depends=(pari jupyter)
makedepends=(cython2)
source=(https://pypi.io/packages/source/p/pari_jupyter/pari_jupyter-$pkgver.tar.bz2)
md5sums=('ab0dc1d09303d33e861088155b82c965')

prepare() {
  cd pari_jupyter-$pkgver
# Use python2
  sed -e 's|python|python2|g' -i spec/kernel.json
}

build() {
  cd pari_jupyter-$pkgver
  python2 setup.py build 
}

package() {
  cd pari_jupyter-$pkgver
  python2 setup.py install --skip-build --root="$pkgdir" --optimize=1
}
