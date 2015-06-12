# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=python-llvmlite
pkgver=0.4.0
pkgrel=2
pkgdesc="Lightweight LLVM python binding for writing JIT compilers"
url="http://numba.pydata.org/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python' 'llvm35')
makedepends=('cython')
source=("https://github.com/numba/llvmlite/archive/v$pkgver.tar.gz")
md5sums=('a5a1641a0e790d9e1d16c16b09ccf83f')

build() {
  cd "$srcdir/llvmlite-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/llvmlite-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
