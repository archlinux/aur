# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-torch-sparse
pkgver=0.6.16
pkgrel=1
pkgdesc='PyTorch Extension Library of Optimized Autograd Sparse Matrix
Operations'
arch=('x86_64')
url='https://github.com/rusty1s/pytorch_sparse'
license=('MIT')
depends=('python' 'python-scipy')
makedepends=('python' 'python-build' 'python-installer' 'python-wheel'
             'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/rusty1s/pytorch_sparse/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('47129f4dd9ce38bc22d58eb9a07dd65a551038cf7a45b15374c3245e84b50196')

_pkgname=pytorch_sparse

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
