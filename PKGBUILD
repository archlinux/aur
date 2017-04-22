# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python2-llvmlite
pkgver=0.17.1
pkgrel=1
pkgdesc="Lightweight LLVM python binding for writing JIT compilers"
url="https://github.com/numba/llvmlite"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python2-enum34' 'llvm>=4.0.0' 'llvm<4.1.0')
makedepends=('cython2')
source=("https://github.com/numba/llvmlite/archive/v$pkgver.tar.gz")
md5sums=('88141e11e4c358865ed1bec7c25d5131')

build() {
  cd "$srcdir/llvmlite-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/llvmlite-$pkgver"
  python2 setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
