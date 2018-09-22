# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=python-processmappingscanner
pkgver=2.3.2
pkgrel=2
pkgdesc="Python module for scanning information on running processes, including mappings, open file-descriptors, process owner, and other information"
arch=('any')
license=('LGPLv3')
url="http://github.com/kata198/ProcessMappingScanner"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python')
source=("https://github.com/kata198/ProcessMappingScanner/archive/${pkgver}.tar.gz")
sha512sums=("6e3a79daecc3b9cbbda580eda2c3119ca619581f19c0d388ae919788204b61dab3f84d73d0736bf53928bbe7f5ed0752835f3197b41efeefa5e34db6257e39e7")

build() {
  cd "$srcdir"/ProcessMappingScanner-$pkgver
  python setup.py build
}

package() {
  cd ProcessMappingScanner-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

