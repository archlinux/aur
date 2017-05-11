# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python-numba
pkgver=0.33.0
pkgrel=1
pkgdesc="NumPy aware dynamic Python compiler using LLVM"
url="http://numba.pydata.org/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python-llvmlite')
makedepends=('cython')
source=("https://github.com/numba/numba/archive/$pkgver.tar.gz")
md5sums=('2dc30cdd897199e143f0c45b2e9904a4')

build() {
  cd "$srcdir/numba-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/numba-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
