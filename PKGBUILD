# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-gpytorch
pkgver=1.8.1
pkgrel=1
pkgdesc='A highly efficient and modular implementation of GPs, with GPU
acceleration. Implemented in PyTorch.'
arch=('x86_64')
url='https://gpytorch.ai'
license=('MIT')
depends=('python' 'python-pytorch' 'python-numpy' 'python-scikit-learn' 'python-scipy')
makedepends=('python' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=(
            'python-black: for [dev] module'
            'twine: for [dev] module'
            'python-pre-commit: for [dev] module'
            'ipython: for [docs/examples] module'
            'python-ipykernel: for [docs] module'
            'python-sphinx: for [docs] module'
            'python-sphinx_rtd_theme: for [docs] module'
            'python-nbsphinx: for [docs] module'
            'm2r: for [docs] module'
            'jupyter: for [examples] module'
            'python-matplotlib: for [examples] module'
            'python-scipy: for [examples] module'
            'python-torchvision: for [examples] module'
            'python-tqdm: for [examples] module'
            'python-pyro-ppl: for [pyro] module'
            'python-pykeops: for [keops] module'
            'python-flake8: for [test] module'
            'python-flake8-print: for [test] module'
            'python-pytest: for [test] module'
            'python-nbval: for [test] module'
           )
source=("$pkgname-$pkgver::https://github.com/cornellius-gp/gpytorch/archive/v$pkgver.tar.gz")
sha256sums=('be1bcbc2d8db835e145d710ba7520ab0c5907fe0e28a08c9d7ac76ae8e4f1f7c')

_pkgname=gpytorch

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
