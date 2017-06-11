# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=python2-processmappingscanner
pkgver=2.2.1
pkgrel=1
pkgdesc="Python module for scanning information on running processes, including mappings, open file-descriptors, process owner, and other information"
arch=('any')
license=('LGPLv3')
url="http://github.com/kata198/ProcessMappingScanner"
makedepends=('python2-setuptools' 'python2')
depends=('python2-setuptools' 'python2')
source=("https://github.com/kata198/ProcessMappingScanner/archive/${pkgver}.tar.gz")
sha512sums=("aca2c42fc6e435f9cc17b352ab06ad19a292556e144bba42340c3abf9f7ef399466df1af34d322495b0181db1261cadda3960ae5946953a467380e9fa1d4fab3")

build() {
  cd "$srcdir"/ProcessMappingScanner-$pkgver
  python2 setup.py build
}

package() {
  cd ProcessMappingScanner-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

