# Original maintainer: Butui Hu <hot123tea123@gmail.com>
# Maintainer: Alex Hirzel <alex@hirzel.us>

pkgname=python-pytorch-lightning
_name=${pkgname#python-}
pkgver=2.0.4
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
sha512sums=('0663c48c77300d0808bd6b5754560caa1fb92758fa50bce859290a98bd1f300de0a894b4bd84d3d075933572b558f73634b0717e07eb2cf336def0298b78af61')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et:
