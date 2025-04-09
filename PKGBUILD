# Maintainer: harrietobrien <harrietobrien@protonmail.com>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-torch-geometric
pkgver=2.6.1
pkgrel=1
_pkgname=pytorch_geometric
pkgdesc='Graph Neural Network Library for PyTorch'
arch=('x86_64')
url='https://pyg.org'
license=('MIT')
depends=('python' 'python-tqdm' 'python-numpy' 'python-scipy' 'python-fsspec'
         'python-jinja' 'python-aiohttp' 'python-requests' 'python-pyparsing'
         'python-scikit-learn' 'python-psutil')
makedepends=('python' 'python-build' 'python-installer' 'python-wheel'
             'python-setuptools' 'python-flit-core')
optdepends=('python-yacs' 'python-hydra-core' 'python-protobuf'
            'python-torch-sparse' 'python-torch-scatter'
            'python-pytorch-lightning' 'python-huggingface-hub' 'python-ase'
            'python-h5py' 'python-numba' 'python-sympy' 'python-pandas'
            'python-captum' 'python-rdflib' 'python-trimesh' 'python-networkx'
            'python-graphviz' 'python-tabulate' 'python-matplotlib'
            'python-pynndescent' 'python-torchmetrics' 'python-scikit-image'
            'python-pytorch-memlab' 'python-pgmpy' 'python-opt_einsum'
            'python-statsmodels' 'python-rdkit' 'python-torch-cluster'
            'python-torch-spline-cov')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pyg-team/pytorch_geometric/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d0f1ced0bfc66fa187544332b21076d0ceedf4b989276cc220a8a857bdf0ae69')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
