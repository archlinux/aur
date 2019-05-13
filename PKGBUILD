# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname='python-func_timeout'
pkgver=4.3.3
pkgrel=2
pkgdesc="Python module which allows you to specify timeouts when calling any existing function, and support for stoppable threads"
arch=('any')
license=('LGPLv3')
url="http://github.com/kata198/func_timeout"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python')

source=("https://github.com/kata198/func_timeout/archive/${pkgver}.tar.gz")
sha512sums=("c80c828e509487339c27efe0c959b4b58028fa3f7ad2a3755c8cfa85effd2cc53c63bca16076604f1ce140a904ab3c5ec2e4c1efaf0417183ed15d1bbc2338f2")

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



