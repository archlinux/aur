# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-torch-geometric
pkgver=2.1.0
pkgrel=1
pkgdesc='Graph Neural Network Library for PyTorch'
arch=('x86_64')
url='https://pytorch-geometric.readthedocs.io'
license=('MIT')
depends=('python' 'python-tqdm' 'python-numpy' 'python-scipy' 'python-jinja'
         'python-requests' 'python-pyparsing' 'python-scikit-learn')
makedepends=('python' 'python-build' 'python-installer' 'python-wheel'
             'python-setuptools')
optdepends=('python-yacs' 'python-hydra-core' 'python-protobuf'
            'python-pytorch-lightning' 'python-h5py' 'python-numba'
            'python-sympy' 'python-pandas' 'python-captum' 'python-rdflib'
            'python-trimesh' 'python-networkx' 'python-tabulate'
            'python-matplotlib' 'python-scikit-image' 'python-pytorch-memlab'
            'python-torchmetrics')
source=("$pkgname-$pkgver::https://github.com/pyg-team/pytorch_geometric/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8433eb59ab53dbd4967c9e0636cdb9e749de1d45c016558f1a1aa74c38a7c1df')

_pkgname=pytorch_geometric

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
