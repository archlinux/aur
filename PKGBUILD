# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-torch-geometric
pkgver=2.3.1
pkgrel=1
pkgdesc='Graph Neural Network Library for PyTorch'
arch=('x86_64')
url='https://pytorch-geometric.readthedocs.io'
license=('MIT')
depends=('python' 'python-tqdm' 'python-numpy' 'python-scipy' 'python-jinja'
         'python-requests' 'python-pyparsing' 'python-scikit-learn'
         'python-psutil' 'python-torch-scatter' 'python-torch-sparse')
makedepends=('python' 'python-build' 'python-installer' 'python-wheel'
             'python-setuptools')
optdepends=('python-yacs' 'python-hydra-core' 'python-protobuf'
            'python-pytorch-lightning' 'python-huggingface-hub' 'python-ase'
            'python-h5py' 'python-numba' 'python-sympy' 'python-pandas'
            'python-captum' 'python-rdflib' 'python-trimesh' 'python-networkx'
            'python-graphviz' 'python-tabulate' 'python-matplotlib'
            'python-torchmetrics' 'python-scikit-image' 'python-pytorch-memlab'
            'python-pgmpy' 'python-opt_einsum' 'python-statsmodels'
            'python-torch-cluster' 'python-torch-spline-cov')
source=("$pkgname-$pkgver::https://github.com/pyg-team/pytorch_geometric/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d557db04a968ae3402e7c301ddd1051189e978a92a0df90e49dc65837e0ec8e8')

_pkgname=pytorch_geometric

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
