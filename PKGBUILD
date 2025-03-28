# Maintainer: redponike <proton (dot) me>
# Maintainer: Alex Hirzel <alex@hirzel.us>
# Contributor: Butui Hu <hot123tea123@gmail.com>

pkgname=python-pytorch-lightning
_pkgname=pytorch_lightning
pkgver=2.5.1
pkgrel=1
pkgdesc="The lightweight PyTorch wrapper for high-performance AI research"
arch=('any')
url='https://lightning.ai'
license=('Apache-2.0')
depends=(
  'python-fsspec'
  'python-lightning-utilities'
  'python-packaging'
  'python-pytorch'
  'python-pyaml'
  'python-torchmetrics'
  'python-tqdm'
  'python-typing_extensions'
)
optdepends=(
  'python-bitsandbytes'
  'python-hydra-core'
  'python-jsonargparse'
  'python-matplotlib'
  'python-omegaconf'
  'python-rich'
  'python-tensorboardx'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('e32f8c6fb4d75e643d88042078b0fbbbf29dd61f411214748b86e4b0ff539a45f05cdb9da12d1e0a46169a4a81e69bec62783e1b5e4ff7ef4bb220d7e90ffdf7')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
# vim:set ts=2 sw=2 et:
