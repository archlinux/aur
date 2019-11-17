# Maintainer: Butui Hu <hot123tea123@gmail.com>

_pkgname=hiddenlayer
pkgname=python-hiddenlayer
pkgver=0.2
pkgrel=1
pkgdesc='A lightweight library for neural network graphs and training metrics for PyTorch, Tensorflow, and Keras'
arch=('any')
url='https://github.com/waleedka/hiddenlayer'
license=('MIT')
makedepends=('python-setuptools')
checkdepends=(
  'flake8'
  'ipython'
  'python-matplotlib'
  'python-numpy'
  'python-pytest'
  'python-pytorch'
  'python-tensorflow'
  'python-torchvision'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/waleedka/hiddenlayer/archive/v${pkgver}.tar.gz")
sha512sums=('95291b6beaa1c131c9aa27d4e6b5b26e00548f4d34c69518fe38baac29c9d9d4f9c770f8339b1319cd54ffaa81895d46dfde17f25c9786ac91bdee2a6d653443')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${_pkgname}-${pkgver}"
  PYTHONPATH=${srcdir}/${_pkgname}-${pkgver}/build/lib pytest -v
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
