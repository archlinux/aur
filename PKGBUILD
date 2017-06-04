# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname='python2-func_timeout'
pkgver=4.2.0
pkgrel=1
pkgdesc="Python module which allows you to specify timeouts when calling any existing function, and support for stoppable threads"
arch=('any')
license=('LGPLv3')
url="http://github.com/kata198/func_timeout"
makedepends=('python2-setuptools' 'python2')
depends=('python2-setuptools' 'python2')

source=("https://github.com/kata198/func_timeout/archive/${pkgver}.tar.gz")
sha512sums=('b021e624a841444f33b31f8df9a46a8588e3779183d6b8bd888deb68323857122c12470b25b137ec96f2101aa85d9ba0972eb82ca25c427f9109f47c6f8a4762')

build() {
  cd "$srcdir"/func_timeout-$pkgver
  python2 setup.py build

}

package() {
  cd func_timeout-$pkgver

  printf "\n\nXXXXXXXXXX: IGNORE 'SYNTAX ERROR' BELOW - EXPECTED BECAUSE OF PYTHON2/PYTHON3 COMPAT\n\n\n"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  printf "\n\nXXXXXXXXXX: IGNORE 'SYNTAX ERROR' ABOVE - EXPECTED BECAUSE OF PYTHON2/PYTHON3 COMPAT\n\n\n"
}



