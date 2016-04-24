# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python2-numba
pkgver=0.25.0
pkgrel=1
pkgdesc="NumPy aware dynamic Python compiler using LLVM"
url="http://numba.pydata.org/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python2-llvmlite>=0.9.0' 'python2-llvmlite<0.10.0' 'python2-funcsigs')
makedepends=('cython2')
source=("https://github.com/numba/numba/archive/$pkgver.tar.gz")
md5sums=('9374683390777fe31925d31f61a75523')

build() {
  cd "$srcdir/numba-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/numba-$pkgver"
  python2 setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1

  mv "$pkgdir"/usr/bin/numba "$pkgdir"/usr/bin/numba2
  mv "$pkgdir"/usr/bin/pycc "$pkgdir"/usr/bin/pycc2
}
