# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname='python-func_timeout'
pkgver=4.3.0
pkgrel=2
pkgdesc="Python module which allows you to specify timeouts when calling any existing function, and support for stoppable threads"
arch=('any')
license=('LGPLv3')
url="http://github.com/kata198/func_timeout"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python')

source=("https://github.com/kata198/func_timeout/archive/${pkgver}.tar.gz")
sha512sums=("9da18dd49b7f987e1c8ff6bec652a1cf5e74234d932e63490eb3d943d5d2d6a9e693970f7d0e7bf2b9a75b99843239c42df8b7292136801403b4c51f7965ad23")

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



