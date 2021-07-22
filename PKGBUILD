# Maintainer: Lam Duong <lamduong2@acm.org>

pkgname=python-fastai2
_pkgname=fastai
pkgver=2.4.1
pkgrel=1
pkgdesc='Deep learning library build on PyTorch with CPU. Version 2 of fastai.'
arch=('any')
url='https://github.com/fastai/fastai'
license=('Apache')
depends=(
  python-fastcore
  python-fastprogress
  python-matplotlib
  python-packaging
  python-pandas
  python-pillow
  python-pip
  python-pytorch
  python-pyaml
  python-requests
  python-scikit-learn
  python-scipy
  python-spacy
  python-torchvision-cuda
)
makedepends=(
  python-setuptools
  python-pip
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/fastai/fastai/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('0b2d20bd1c16a94fb9b7de06046836bfa24d5bb0d57e8095223b3e22a2b070cf56d8c24371f3b664cb5819cfa807f522c63b472bb2f441851838d39b175f1b22')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
