# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=python-processmappingscanner
pkgver=2.1.2
pkgrel=1
pkgdesc="Python module for scanning information on running processes, including mappings, open file-descriptors, process owner, and other information"
arch=('any')
license=('LGPLv3')
url="http://github.com/kata198/ProcessMappingScanner"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python')
source=("https://github.com/kata198/ProcessMappingScanner/archive/${pkgver}.tar.gz")
sha512sums=('b9db33b3b1e27b1f9efb6689cb70c5bb512169f637abf47cd9791b15da932bca60c34ef0447fce989c36dccdc6a573df636e16d8e0db5baf0b25f454fdb6a67d')

build() {
  cd "$srcdir"/ProcessMappingScanner-$pkgver
  python setup.py build
}

package() {
  cd ProcessMappingScanner-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

