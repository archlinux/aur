# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python-llvmlite
pkgver=0.7.0
pkgrel=2
pkgdesc="Lightweight LLVM python binding for writing JIT compilers"
url="http://numba.pydata.org/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python' 'llvm<3.7.0')
makedepends=('cython')
source=("https://github.com/numba/llvmlite/archive/v$pkgver.tar.gz")
md5sums=('712b1b2267dc312c1806b2667bc761bc')

build() {
  cd "$srcdir/llvmlite-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/llvmlite-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
