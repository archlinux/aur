# Original maintainer: Butui Hu <hot123tea123@gmail.com>
# Maintainer: Alex Hirzel <alex@hirzel.us>

pkgname=python-pytorch-lightning
_name=${pkgname#python-}
pkgver=2.0.6
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
sha512sums=('0b06a776ef7fdc910e8ef2463975233047b4d71096e02d28b140d7c717a7ec2a70ba8c5e21a35d0ac542cd0b550663cc5577bff0307acec4e60a7dc2f67fe7f2')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et:
