# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python-numba
pkgver=0.21.0
pkgrel=1
pkgdesc="NumPy aware dynamic Python compiler using LLVM"
url="http://numba.pydata.org/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python-llvmlite>=0.6.0')
makedepends=('cython')
source=("https://pypi.python.org/packages/source/n/numba/numba-$pkgver.tar.gz")
md5sums=('d1b17ba91ce08a2b2188c301929ed3c8')

build() {
  cd "$srcdir/numba-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/numba-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
