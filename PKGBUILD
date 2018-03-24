# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python-numba
pkgver=0.37.0
pkgrel=1
pkgdesc="NumPy aware dynamic Python compiler using LLVM"
url="http://numba.pydata.org/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python-llvmlite' 'python-numpy')
makedepends=('cython')
source=("https://github.com/numba/numba/archive/$pkgver.tar.gz")
md5sums=('fab6e651c525d8c524794ac6292c2893')

build() {
  cd "$srcdir/numba-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/numba-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
