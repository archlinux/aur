# Maintainer: Oystein Sture <oysstu@gmail.com>
# Contributor: 
pkgname=python-check-shapes
pkgver=1.1.1
pkgrel=1
pkgdesc="Library for annotating and checking tensor shapes."
url="https://github.com/GPflow/check_shapes"
arch=('any')
license=('Apache')
depends=('python' 'python-lark-parser' 'python-dropstackframes')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://github.com/GPflow/check_shapes/archive/v${pkgver}.tar.gz")
sha256sums=('aa1acff5ea9fda0c91fd86284cef54c92bc604124494e208c845dcaae2e80753')

build() {
  cd "${srcdir}"/check_shapes-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/check_shapes-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
