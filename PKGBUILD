# Maintainer: Oystein Sture <oysstu@gmail.com>
# Contributor: 
pkgname=python-check-shapes
pkgver=1.0.0
pkgrel=1
pkgdesc="Library for annotating and checking tensor shapes."
url="https://github.com/GPflow/check_shapes"
arch=('any')
license=('Apache')
depends=('python' 'python-lark-parser')
makedepends=('python-pip' 'python-poetry')
source=("https://github.com/GPflow/check_shapes/archive/v${pkgver}.tar.gz")
sha256sums=('a29c6d8f6f444809bb8926a0d2943c243669c6f5dae17670c6c9428e1f2bee3a')

build() {
  cd "${srcdir}"/check_shapes-${pkgver}
  poetry build --format wheel
}

package() {
  cd "${srcdir}"/check_shapes-${pkgver}
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps dist/*.whl
}
