# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-torch-geometric
pkgver=2.4.0
pkgrel=1
pkgdesc='Graph Neural Network Library for PyTorch'
arch=('x86_64')
url='https://pytorch-geometric.readthedocs.io'
license=('MIT')
depends=('python' 'python-tqdm' 'python-numpy' 'python-scipy' 'python-fsspec'
         'python-jinja' 'python-aiohttp' 'python-requests' 'python-pyparsing'
         'python-scikit-learn' 'python-psutil' 'python-torch-scatter'
         'python-torch-sparse')
makedepends=('python' 'python-build' 'python-installer' 'python-wheel'
             'python-setuptools' 'python-flit-core')
optdepends=('python-yacs' 'python-hydra-core' 'python-protobuf'
            'python-pytorch-lightning' 'python-huggingface-hub' 'python-ase'
            'python-h5py' 'python-numba' 'python-sympy' 'python-pandas'
            'python-captum' 'python-rdflib' 'python-trimesh' 'python-networkx'
            'python-graphviz' 'python-tabulate' 'python-matplotlib'
            'python-pynndescent' 'python-torchmetrics' 'python-scikit-image'
            'python-pytorch-memlab' 'python-pgmpy' 'python-opt_einsum'
            'python-statsmodels' 'python-rdkit' 'python-torch-cluster'
            'python-torch-spline-cov')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pyg-team/pytorch_geometric/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e2737233af2fbca424bce2bf9e04befb31ad371a8eb0c0ccc958ed2ddbe9d256')

_pkgname=pytorch_geometric

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
