# Maintainer: LwhJesse <lwhjesse@gmail.com>

pkgname=python-moocore
_name=moocore
pkgver=0.3.1
pkgrel=1
pkgdesc="Core Algorithms for Multi-Objective Optimization"
arch=('x86_64')
url="https://multi-objective.github.io/moocore/python/"
license=('LGPL-2.1-or-later')
depends=(
  'python'
  'python-cffi'
  'python-numpy'
  'python-platformdirs'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("https://files.pythonhosted.org/packages/source/m/moocore/moocore-${pkgver}.tar.gz")
sha256sums=('a8f83cfbc0aa81c1c9dd33e473adbc9b638dc3b1a6943753f8146770bb76bae4')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
