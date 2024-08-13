# Maintainer: Oystein Sture <oysstu@gmail.com>
# Contributor: 
pkgname=python-dropstackframes
pkgver=0.1.1
pkgrel=1
pkgdesc="A python library for dropping stack frames"
url="https://github.com/jesnie/dropstackframe"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
source=("http://github.com/jesnie/dropstackframe/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1370f5b7654dcd45b9728f9efa7ee47a61b3b04b0db261e3aca59adf4d040d75')

build() {
  cd "${srcdir}"/dropstackframe-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/dropstackframe-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
