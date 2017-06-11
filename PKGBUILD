# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=python-processmappingscanner
pkgver=2.2.2
pkgrel=1
pkgdesc="Python module for scanning information on running processes, including mappings, open file-descriptors, process owner, and other information"
arch=('any')
license=('LGPLv3')
url="http://github.com/kata198/ProcessMappingScanner"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python')
source=("https://github.com/kata198/ProcessMappingScanner/archive/${pkgver}.tar.gz")
sha512sums=("7e8c4ab46ebd7c215fddc27a09fb9a9f748de44425f0ce40eaf2b6e92c625b7de02fa3c111d383c4ec50861f923f9ed30814fa1de980306d051af554cb07477b")

build() {
  cd "$srcdir"/ProcessMappingScanner-$pkgver
  python setup.py build
}

package() {
  cd ProcessMappingScanner-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

