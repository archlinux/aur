# Maintainer: Thomas Dziedzic < gostrc at gmail >

pkgname=python-mlpy
pkgver=3.5.0
pkgrel=1
pkgdesc='Machine Learning PYthon (mlpy) is a high-performance Python package for predictive modeling.'
arch=('i686' 'x86_64')
url='http://mlpy.sourceforge.net/'
license=('GPL3')
depends=('python-scipy' 'gsl')
source=("http://downloads.sourceforge.net/project/mlpy/mlpy%20$pkgver/mlpy-$pkgver.tar.gz")
md5sums=('9970bdb6a1e931eb8f92a771a346fa27')

build() {
  cd mlpy-$pkgver
  python setup.py build
}

package() {
  cd mlpy-$pkgver
  python setup.py install \
      --skip-build \
      --prefix=/usr \
      --root="$pkgdir" \
      --optimize=1
}

