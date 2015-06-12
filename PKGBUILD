# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=python-numba
pkgver=0.18.2
pkgrel=1
pkgdesc="NumPy aware dynamic Python compiler using LLVM"
url="http://numba.pydata.org/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python-llvmlite')
makedepends=('cython')
source=("https://pypi.python.org/packages/source/n/numba/numba-$pkgver.tar.gz")
md5sums=('7b255ec34dde793a865d18ae11c4480e')

build() {
  cd "$srcdir/numba-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/numba-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
