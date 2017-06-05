# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=python-findprocessesusing
pkgver=2.2.0
pkgrel=1
pkgdesc='Application which scans running processes on the system for given mappings (shared libraries, executables) or open file descriptors'
arch=('any')
license=('GPLv2')
url="http://github.com/kata198/findProcessesUsing"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python' 'python-processmappingscanner')
source=("https://github.com/kata198/findProcessesUsing/archive/${pkgver}.tar.gz")
sha512sums=("4388aae94bb76a45631ea5d8589be7c1fe62257f9b863deebcb5db745c4edd3e3529dea320dbfebbdd1f1cb7b6a1be40a9179ccd5efce0ffe7b14b054595a974")

build() {
  cd "$srcdir"/findProcessesUsing-$pkgver
  python setup.py build
}

package() {
  cd findProcessesUsing-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
