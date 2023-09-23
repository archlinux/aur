# Original maintainer: Butui Hu <hot123tea123@gmail.com>
# Maintainer: Alex Hirzel <alex@hirzel.us>

pkgname=python-pytorch-lightning
_name=${pkgname#python-}
pkgver=2.0.9
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
sha512sums=('1a983df731406d7cfe9b3c0f660bcdc6e5549b27ae0d2c3e8c52446f221d21fe6bd1360b88d2c6432e3376cc87c19a4ffb71693b1d3fa81b6080abec3de6db08')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et:
