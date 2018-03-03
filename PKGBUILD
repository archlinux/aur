# $Id: PKGBUILD 126373 2015-01-21 20:31:43Z arojas $
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=pari-jupyter
pkgver=1.3.2
pkgrel=1
pkgdesc="Jupyter kernel for PARI"
arch=(x86_64)
url="https://github.com/jdemeyer/pari_jupyter"
license=(GPL)
depends=(pari jupyter python2)
makedepends=(cython2)
source=(https://pypi.io/packages/source/p/pari_jupyter/pari_jupyter-$pkgver.tar.gz)
sha256sums=('26c306a5384f6a98988daa825a5c3add0e71414b69a1f28f8dd60a412e805af9')

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
