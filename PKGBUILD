# Original maintainer: Butui Hu <hot123tea123@gmail.com>
# Maintainer: Alex Hirzel <alex@hirzel.us>

pkgname=python-pytorch-lightning
_name=${pkgname#python-}
pkgver=2.2.1
pkgrel=1
pkgdesc="The lightweight PyTorch wrapper for high-performance AI research"
arch=('any')
url='https://lightning.ai'
license=('Apache-2.0')
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
sha512sums=('dfe0747322c2f178c661e6f37eafde62dfc4791fca293c0bdb0b4448adca0fb8167e9e1c85436be6e0946514ecfebe37a2352901471be5c6c1017ca78ad989a2')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et:
