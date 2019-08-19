# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname='python-func_timeout'
pkgver=4.3.5
pkgrel=1
pkgdesc="Python module which allows you to specify timeouts when calling any existing function, and support for stoppable threads"
arch=('any')
license=('LGPLv3')
url="http://github.com/kata198/func_timeout"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python')

source=("https://github.com/kata198/func_timeout/archive/${pkgver}.tar.gz")
sha512sums=("0711b8bdd2b55e7473fb525e70b0e6596bb11ba074e6110c52e7fdc842d87ef2d57307f02af86eef1b1e7e4c84a9faf25ec450d25addce3ebb93e3d341b566ac")

build() {
  cd "$srcdir"/func_timeout-$pkgver
  python setup.py build

}

package() {
  cd func_timeout-$pkgver

  printf "\n\nXXXXXXXXXX: IGNORE 'SYNTAX ERROR' BELOW - EXPECTED BECAUSE OF PYTHON2/PYTHON3 COMPAT\n\n\n"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  printf "\n\nXXXXXXXXXX: IGNORE 'SYNTAX ERROR' ABOVE - EXPECTED BECAUSE OF PYTHON2/PYTHON3 COMPAT\n\n\n"
}



