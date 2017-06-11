# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=python2-processmappingscanner
pkgver=2.3.1
pkgrel=1
pkgdesc="Python module for scanning information on running processes, including mappings, open file-descriptors, process owner, and other information"
arch=('any')
license=('LGPLv3')
url="http://github.com/kata198/ProcessMappingScanner"
makedepends=('python2-setuptools' 'python2')
depends=('python2-setuptools' 'python2')
source=("https://github.com/kata198/ProcessMappingScanner/archive/${pkgver}.tar.gz")
sha512sums=("33b197d91d3f2a9e7890283c22ca90733010c32f75f6e48bbb06976c3ae49dc49013b87abbd5f9de8e6505b341d1a834829e4f4a000d2532f8b0a879845fcc19")

build() {
  cd "$srcdir"/ProcessMappingScanner-$pkgver
  python2 setup.py build
}

package() {
  cd ProcessMappingScanner-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

