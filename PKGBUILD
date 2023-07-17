# Original maintainer: Butui Hu <hot123tea123@gmail.com>
# Maintainer: Alex Hirzel <alex@hirzel.us>

pkgname=python-pytorch-lightning
_name=${pkgname#python-}
pkgver=2.0.5
pkgrel=1
pkgdesc="The lightweight PyTorch wrapper for high-performance AI research"
arch=('any')
url='https://lightning.ai'
license=('Apache')
depends=(
  python-fastapi
  python-fsspec
  python-google-api-core
  python-jsonargparse
  python-lightning-utilities
  python-matplotlib
  python-mpi4py
  python-pandas
  python-psutil
  python-pyaml
  python-pydeprecate
  python-pytest
  python-rich
  python-scikit-learn
  python-tensorboardx
  python-torchmetrics
  python-torchvision
  python-twine
  tensorboard
  uvicorn
)
optdepends=(
  'python-apex: mixed precision support'
  'python-horovod: for distributed training'
)
makedepends=(
  python-build
  python-installer
  python-wheel
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('4640b7afbb089754b9fbbfc2f5ed39da8897ca599f30cc3ff497fa289280cbad99ead2096eb9af3b25ab692339d4ebbecd816cc76297aa121a8247291eb43e12')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et:
