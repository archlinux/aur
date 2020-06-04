# Maintainer: Butui Hu <hot123tea123@gmail.com>

_pkgname=PyRetri
pkgname=python-pyretri-git
_pkgver=0.1.0
pkgver=0.1.0.r83.c559bb8
pkgrel=1
pkgdesc='Open source deep learning based unsupervised image retrieval toolbox built on PyTorch'
arch=('any')
url='https://github.com/PyRetri/PyRetri'
license=('Apache')
depends=(
  python-numpy
  python-pytorch
  python-scikit-learn
  python-torchvision
  python-tqdm
  python-yacs
)
makedepends=(
  git
  python-setuptools
)
provides=(python-pyretri=${pkgver})
conflicts=(python-pyretri)
source=("${_pkgname}::git+https://github.com/PyRetri/PyRetri.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "%s.r%s.%s" "${_pkgver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et:
