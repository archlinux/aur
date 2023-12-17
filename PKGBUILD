# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-torch-sparse
pkgver=0.6.18
pkgrel=1
pkgdesc='PyTorch Extension Library of Optimized Autograd Sparse Matrix
Operations'
arch=('x86_64')
url='https://github.com/rusty1s/pytorch_sparse'
license=('MIT')
depends=('python' 'python-scipy')
makedepends=('python' 'python-build' 'python-installer' 'python-wheel'
             'python-setuptools' 'parallel-hashmap')
source=("$pkgname-$pkgver::https://github.com/rusty1s/pytorch_sparse/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a9e194cddc17481001ac4592a058450493ce13780e8ce3eb54d4f79706e69c91')

_pkgname=pytorch_sparse

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
