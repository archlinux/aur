# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname='python-func_timeout'
pkgver=4.3.2
pkgrel=2
pkgdesc="Python module which allows you to specify timeouts when calling any existing function, and support for stoppable threads"
arch=('any')
license=('LGPLv3')
url="http://github.com/kata198/func_timeout"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python')

source=("https://github.com/kata198/func_timeout/archive/${pkgver}.tar.gz")
sha512sums=("c93b9acfe8ab43e24cb61b0fcaf29961674a1e794d7307dee9e9a990dd0c9730a4db0e71737e87723a49cf7964772bcd2aa7b0337183465796927a317d7679b8")

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



