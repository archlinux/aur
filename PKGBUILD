# Maintainer: Tim Savannah <kata198@gmail.com>

# Just the python2 libs. The tools are based on python3 and can be
#  found in the "jsontocsv" package

pkgname='python2-jsontocsv'
_realName='jsonToCsv'
pkgver=1.0.1
pkgrel=1
pkgdesc="Extract data from json and convert to CSV"
arch=('any')
license=('LGPLv3')
url="http://github.com/kata198/jsonToCsv"
makedepends=('python2-setuptools' 'python2')
depends=('python2-setuptools' 'python2')
source=("https://github.com/kata198/jsonToCsv/archive/${pkgver}.tar.gz")
sha512sums=("003671c2e50e7b45621494a5edb34171db829ee74f5471381fb3173cd546d35609eb38fa392315352f90da6b809fbdc1cc839b724a456335d60cb90c9598725a")

build() {
  cd "$srcdir/${_realName}-$pkgver"
  python2 setup.py build
}

package_python2-jsontocsv() {
  pkgdesc="Python3 lib to extract data from json and convert to CSV"
  cd "${_realName}-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # Remove tools from lib package
  rm -Rf "$pkgdir/usr/bin"
}
