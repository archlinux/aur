# Maintainer: Butui Hu <hot123tea123@gmail.com>

_pkgname=mmclassification
pkgname=python-mmclassification
pkgver=0.1.0
pkgrel=1
pkgdesc='OpenMMLab Image Classification Toolbox and Benchmark'
arch=('any')
url='https://github.com/open-mmlab/mmclassification'
license=('Apache')
depends=(
  python-mmcv
  python-numpy
  python-pytorch
)
makedepends=(
  git
  python-setuptools
)
source=("${pkgname}"::git+https://github.com/open-mmlab/mmclassification.git)
sha512sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  python setup.py build
}

package() {
  cd "${pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et:
