# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=python-processmappingscanner
pkgver=2.2.1
pkgrel=1
pkgdesc="Python module for scanning information on running processes, including mappings, open file-descriptors, process owner, and other information"
arch=('any')
license=('LGPLv3')
url="http://github.com/kata198/ProcessMappingScanner"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python')
source=("https://github.com/kata198/ProcessMappingScanner/archive/${pkgver}.tar.gz")
sha512sums=("aca2c42fc6e435f9cc17b352ab06ad19a292556e144bba42340c3abf9f7ef399466df1af34d322495b0181db1261cadda3960ae5946953a467380e9fa1d4fab3")

build() {
  cd "$srcdir"/ProcessMappingScanner-$pkgver
  python setup.py build
}

package() {
  cd ProcessMappingScanner-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

