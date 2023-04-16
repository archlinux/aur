# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-gpytorch
pkgver=1.10
pkgrel=1
pkgdesc='A highly efficient and modular implementation of GPs, with GPU
acceleration. Implemented in PyTorch.'
arch=('x86_64')
url='https://gpytorch.ai'
license=('MIT')
depends=('python' 'python-scikit-learn' 'python-linear-operator' 'python-pytorch')
makedepends=('git' 'python' 'python-build' 'python-installer' 'python-wheel'
             'python-setuptools' 'python-setuptools-scm')
optdepends=(
            'ipython: for [examples] module'
            'jupyter: for [examples] module'
            'python-matplotlib: for [examples] module'
            'python-scipy: for [examples] module'
            'python-torchvision: for [examples] module'
            'python-tqdm: for [examples] module'
            'python-pyro-ppl: for [pyro] module'
            'python-pykeops: for [keops] module'
           )
source=("$pkgname-$pkgver::git+https://github.com/cornellius-gp/gpytorch.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
